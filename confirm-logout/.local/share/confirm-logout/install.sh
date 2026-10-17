#!/usr/bin/sh

if [ ! "$1" ]; then
    # Get releases
    releases=$(
        curl -fsSL \
            "https://api.github.com/repos/bag1s3k/dotfiles/releases?per_page=100"
    ) || {
        printf 'Failed to get releases from GitHub.\n' >&2
        exit 1
    }

    # Select latest release
    tag=$(printf '%s' "$releases" | jq -er '
        [
            .[]
            | select(.tag_name | startswith("confirm-logout-v"))
            | select(.draft == false and .prerelease == false)
        ]
        | max_by(.published_at)
        | .tag_name // empty
    ') || {
        printf 'Could not select a stable confirm-logout release.\n' >&2
        exit 1
    }
else
    tag=$1
fi

download_dir=$(mktemp -d) || {
    printf 'Failed to create a temporary directory.\n' >&2
    exit 1
}
trap 'rm -rf -- "$download_dir"' EXIT

curl -fsSL \
    "https://github.com/bag1s3k/dotfiles/releases/download/$tag/confirm-logout" \
    -o "$download_dir/confirm-logout" || {
    printf 'Failed to download confirm-logout for tag %s.\n' "$tag" >&2
    exit 1
}

curl -fsSL \
    "https://github.com/bag1s3k/dotfiles/releases/download/$tag/SHA256SUMS" \
    -o "$download_dir/SHA256SUMS" || {
    printf 'Failed to download checksums.\n' >&2
    exit 1
}

(cd "$download_dir" && sha256sum -c SHA256SUMS) || {
    printf 'Checksum verification failed.\n' >&2
    exit 1
}

install -Dm755 \
    "$download_dir/confirm-logout" \
    "$HOME/.local/bin/confirm-logout" || {
    printf 'Failed to install confirm-logout to %s.\n' "$HOME/.local/bin/confirm-logout" >&2
    exit 1
}

printf 'Successfully installed!\n'
