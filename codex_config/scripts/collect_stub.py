#!/usr/bin/env python3
import argparse
import json
from datetime import datetime
from pathlib import Path

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--config", required=True)
    args = p.parse_args()

    out_dir = Path("data_raw")
    out_dir.mkdir(parents=True, exist_ok=True)

    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    out_path = out_dir / f"raw_stub_{stamp}.json"

    payload = {
        "note": "Replace scripts/collect_stub.py with your real collector in collect_py/",
        "config_used": args.config,
        "created_at": stamp,
    }
    out_path.write_text(json.dumps(payload, indent=2))
    print(f"Wrote {out_path}")

if __name__ == "__main__":
    main()