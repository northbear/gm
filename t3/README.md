# Task 3

Use Dockerfile as a platform to implement a common CI/CD pipeline (Build -&gt; Test -&gt; Deliver -&gt; Deploy)
with using next technologies: docker, git, cmake, make, ctest. You can use your code or someone’s
opensource as well.

## Implementation

Test C++ project is located in `helloworld/` directory.
The solution provides a builder container image based on docker image ubuntu:20.04. The builder
image contains cicd tools stored in directory `cicd-tools/`. The cicd tools scripts wrap up
a basic pipeline logics.

To prepare the builder image, use script `./make-ubuntu-builder-image.sh`. it creates an image with name
`ubuntu-builder:0.0.1`.

An example of using the solution is provided in script `./pipeline-helloworld-build-project.sh`.


*NB* CTest stage of the is not implemented yet. WIP

