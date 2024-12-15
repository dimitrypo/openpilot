FROM ghcr.io/commaai/openpilot-base:latest

RUN apt update && apt install -y vim net-tools usbutils htop ripgrep tmux wget mesa-utils xvfb libxtst6 libxv1 libglu1-mesa libegl1 gdb bash-completion python3-pip python3-dev python3-venv \
    libgl1 libglx-mesa0 \
    qtbase5-dev libqt5positioning5 libqt5positioning5-plugins qtpositioning5-dev \
    libqt5multimedia5 qtmultimedia5-dev \
    libqt5location5 qtlocation5-dev

# Create and activate virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Create necessary directories with proper permissions
RUN mkdir -p /.comma/params && \
    chown -R batman:batman /.comma && \
    chmod -R 777 /.comma

# Copy project and install dependencies
WORKDIR /workspaces/openpilot
COPY . .
RUN pip3 install -e ".[dev,tools,testing]"

RUN wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu66_66.1-2ubuntu2_amd64.deb
RUN dpkg -i libicu66_66.1-2ubuntu2_amd64.deb

RUN usermod -aG video batman

USER batman

RUN cd $HOME && \
    curl -O https://raw.githubusercontent.com/commaai/agnos-builder/master/userspace/home/.tmux.conf && \
    curl -O https://raw.githubusercontent.com/commaai/agnos-builder/master/userspace/home/.vimrc
