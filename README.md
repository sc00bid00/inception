# Inception Project README

Inception Logo <!-- If you have a project logo, you can include it here -->


## Welcome to the Inception project repository! This project was developed as a mandatory part of the 42 School curriculum in Heilbronn and was successfully evaluated on Friday, 27th October 2023.

### lsordo@student.42heilbronn.de

## Project Overview

Inception is a Docker-based project that focuses on composing three containers to create a networked simulation of a WordPress website. It explores several key areas, including:

    Docker containerization and management
    Networking concepts within Docker
    Understanding the architecture of WordPress and its components
    Deployment of a MariaDB database
    Setting up an Nginx web server

## Learning Objectives

Throughout the project, you had the opportunity to gain hands-on experience and knowledge in the following areas:

    Docker: You learned how to use Docker to containerize and manage your application components, ensuring isolation and reproducibility.

    Networking: You explored networking in Docker, enabling containers to communicate with each other and function as a cohesive system.

    WordPress and MariaDB: You delved into the architecture of WordPress and its database management using MariaDB, an essential component of WordPress.

    Nginx: You configured and managed an Nginx web server to serve your WordPress site to users.

## Challenges Faced

During the development of Inception, you encountered various challenges:

    Server Networking Setup: Configuring and managing the networking aspects of your containers, including connecting them together, was a complex task.

    SSL Standards (HTTPS): Ensuring compliance with SSL standards for HTTPS security required careful configuration and management.

    Personalization of the Web Domain and WordPress Contents: Customizing the web domain and the content of your WordPress site was essential for making your project unique.

    Configuration of Single Services: Properly configuring each of the service components (WordPress, MariaDB, Nginx) was a detailed and challenging process.

    Security and User Management: Addressing security concerns and managing user access to the application added an extra layer of complexity to the project.

## Hosting in VirtualBox

This project must be hosted in a VirtualBox virtual machine due to specific privilege requirements. To set up the project in VirtualBox, you'll need to follow these additional steps:

    Install VirtualBox on your local machine if it's not already installed.

    Create a new virtual machine in VirtualBox with the necessary resources (CPU, RAM, etc.).

    Configure the virtual machine to meet the project's privilege requirements. This may include adjusting settings related to CPU virtualization, memory allocation, and network configurations.

    Clone this repository to the virtual machine.

    Follow the instructions in the project documentation (if available) or any setup scripts provided to deploy the project within the virtual machine.

    Ensure that you have the necessary environment variables, such as domain names and SSL certificates, properly configured within the virtual machine.

    Start the Docker containers within the virtual machine as per the project's instructions.

    Access the WordPress site via your web browser from your host machine using the configured domain.

## Getting Started

To get started with this project, make sure you have VirtualBox and Docker installed on your host machine, and follow the instructions for setting up the project in a VirtualBox virtual machine.

Also personalize all files in the repository, i.e. passwords in the .env file (included here solely for didactical purpose), local volumes mouting directories, personalized domain aliases, etc...

## Usage

### Start
Launch a shell and:
```git clone <repository_url> <your_local_folder>
cd <your_local_folder>
make```

Open a browser on the host (likely the virtual machine):
```https://your_domain:443```

### Stop
Launch another shell and
```cd <you_local_folder>
make down```

Despite not being sure on functionality, a develop branch contains lots of interesting stuff for debugging, included some bash scripts that have spared me hours of painful tipping on the keyboard, or at least they should have.

## Acknowledgement and credits
A big thank you as always to the 42 School in Heilbronn for the opportunity to work on this project and gain valuable skills in Docker, networking, WordPress, MariaDB, and Nginx.

Thank You to Rouven, Franziska and Max: Your generosity is incredible, and I love you.

Thank You to Kathrin, knowing not to be alone is of great confort in the dark moments.

Thank You tomy three evaluators: it was getting late on Friday evening, but you committed and went through the evaluation with great attention and in detail. Really apreaciate your professionalism.

## License
This project is open source and available under the GNU License.
