#!/usr/bin/env bash
source .env && \
cargo contract instantiate --execute --suri "$SEED" --url "$URL" \
    --constructor new \
    --args 5FLJfjgdkeNEAvEdrCJnXZosUjrSMJ7Bb3SHtvdDPdRyHVGt \"test\" \"tst\"