import os
import sys

def main():
    allowed_executors = os.getenv("ALLOWED_EXECUTORS", "")
    actor = os.getenv("GITHUB_ACTOR", "")

    allowed_users = allowed_executors.split()

    print(f"✅ Allowed users: {allowed_users}")
    print(f"👤 Triggered by: {actor}")

    if actor not in allowed_users:
        print(f"❌ Access denied: '{actor}' is not allowed to run this job.")
        sys.exit(1)

    print(f"✅ Access granted to '{actor}'.")

if __name__ == "__main__":
    main()
