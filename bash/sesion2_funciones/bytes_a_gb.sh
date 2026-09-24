
bytes=$1

bytes_a_gb() {
    echo "scale=2; $bytes / 1073741824" | bc
}

bytes_a_gb