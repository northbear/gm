# Task 1

### 1. How did you configure the Dockerfile to perform this task?

In this case, I configure the application (particulary a port the application is running on)
via environment variable APP_PORT.

### 2. Why did you choose this way of configuration and are there any alternatives?

It's most simple and most flexible way to define parameters. You can redefine its value almost on every
stage of a building and/or a execution.
There is a lot of another ways to configure an container application. It's  mostly defined by
the application capabilities. Some of them is:
1. via command line parameters. If an application executable is running by ENTRYPOINT command in
Dockerfile, arguments provided at the end of command `docker run` will be passed to the executable
as command-line arguments.
2. via storage/volume. An containerized applicaiton can be configured by configuration file/files
exported inside the applicaiton container via shared storage/volume.
3. via predefined network services/databases, like HashiCorp consul, different kind key/value storages
and so on.

### 3. How did you install the needed packages, application, and configuration?

I use Go language for this task. it has built-in tools for package and dependency management.
If I have used Python I'd use venv and pip-install tools to configure proper enviroment for containerized
python application.
