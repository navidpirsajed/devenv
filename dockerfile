# Use the latest Ubuntu image as the base image
FROM ubuntu:latest

# Update the package list and install necessary packages
FROM ubuntu:latest

# Copy the packages.txt file to the container
COPY config/packages.txt /tmp/packages.txt

# Install the packages
RUN apt-get update
RUN apt-get install -y $(cat /tmp/packages.txt)

# Set up SSH
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh

# Copy the public key to the container
COPY ./config/id_rsa.pub /root/.ssh/authorized_keys

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 22 for SSH
EXPOSE 22

# Install Oh My Zsh and set as default shell
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s $(which zsh)

# Set the entrypoint to the script
CMD ["/entrypoint.sh"]