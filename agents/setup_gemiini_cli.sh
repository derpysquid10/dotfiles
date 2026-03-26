########### Gemini CLI (Node-based) ###########

# 1. Load NVM into the current script session (Critical for pathing)
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Check if gemini-chat command exists (the actual name of the binary)
if ! command -v gemini-chat &> /dev/null; then
    echo "Gemini CLI not found. Setting up Node environment..."

    # 2. Install NVM if not present
    if [ ! -d "$HOME/.nvm" ]; then
        echo "Installing NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
        # Re-source after installation
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    fi

    # 3. Ensure a Node version is installed and ACTIVE
    if ! command -v node &> /dev/null; then
        echo "Installing Node.js (LTS)..."
        nvm install --lts
    fi
    
    # 4. Explicitly tell NVM to use the installed version
    nvm use --lts
    nvm alias default 'lts/*'

    # 5. Install the Gemini CLI globally
    echo "Installing @google/gemini-cli..."
    npm install -g @google/gemini-cli

    # 6. Refresh shell hash so it sees the new binary immediately
    hash -r
else
    echo "Gemini CLI (gemini-chat) is already installed."
fi

# --- Optional: Add a bash alias if you want to type 'gemini' instead of 'gemini-chat' ---
if ! grep -q "alias gemini=" ~/.bashrc; then
    echo "Adding 'gemini' alias to .bashrc..."
    echo "alias gemini='gemini-chat'" >> ~/.bashrc
fi