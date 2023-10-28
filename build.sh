# Copy the public key of the user's SSH key pair to the config directory
cp ~/.ssh/id_rsa.pub ./config

# Build a Docker image with the name "devenv"
docker build -t devenv .

# Remove the public key from the config directory
rm ./config/id_rsa.pub