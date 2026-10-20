#!/bin/bash
# Automated backup using tar and gzip

set -e

# Define source, backup path, and timestamp
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="${BACKUP_DIR:-$HOME/shell-backups}"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/practice-scripts_${TIMESTAMP}.tar.gz"

# Create backup directory
prepare_backup_dir() {
    if [[ ! -d "$BACKUP_DIR" ]]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backup directory created: $BACKUP_DIR"
    fi
}

# Create compressed backup
take_backup() {
    tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
    echo "Backup created: $ARCHIVE"
    echo "Backup size: $(du -h "$ARCHIVE" | awk '{print $1}')"
}

# Keep only the latest 7 backups
cleanup_old_backups() {
    cd "$BACKUP_DIR"
    ls -1t practice-scripts_*.tar.gz 2>/dev/null | tail -n +8 | xargs -r rm -f
}

# Execute backup workflow
prepare_backup_dir
take_backup
cleanup_old_backups

# Display available backups
echo "Backup completed. Available backups:"
ls -lh "$BACKUP_DIR"/practice-scripts_*.tar.gz