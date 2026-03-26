#!/bin/bash

########### Claude Code ###########

# Download claude code if it doesn't exist yet
if ! command -v claude &> /dev/null; then
    echo "Claude Code is not installed. Installing..."
    curl -fsSL https://claude.ai/install.sh | bash
fi


########### Claude Swap ###########

# Download uv tool if it doesn't exist first
if ! command -v uv &> /dev/null; then
    echo "uv is not installed. Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    
    # Ensure uv is available in the current session's PATH
    source "$HOME/.local/bin/env"
fi

# Install claude-swap via uv
uv tool install claude-swap

# Try adding current claude account, fine if fails
# The '|| true' ensures the script keeps running even if this command throws an error
cswap --add-account || true


########### Plugins ###########

# 1. Temporarily hijack the 'sudo' command with a dummy function
sudo() {
    echo -e "\n[Notice] Blocked an attempt to run sudo: $*\n"
}
export -f sudo

# 2. Run the script (we still pipe a single Enter for the initial prompt)
printf "\n" | bash <(curl -s https://raw.githubusercontent.com/ykdojo/claude-code-tips/main/scripts/setup.sh)

# 3. Clean up the dummy function so your terminal returns to normal
unset -f sudo