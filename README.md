# Ultimate pandoc framework

## What is it?

I'm a big fan of using [pandoc](https://pandoc.org) to write quick Markdown and generate beautiful, TeX-based documents and presentations. However, for heavy customization, constant back and forth to the pandoc documentation and managing a dirty `build.sh` file containing the pandoc command with all its flags was too painful. 

That's why I created this pandoc framework, allowing to easily configure and use pandoc with YAML files and a container-based reproducible and distributable build system. This framework is aimed at producing TeX or Beamer-based PDF documents and presentations. It can nevertheless be easily adapted to every input / output format supported by pandoc.

## Basic usage

Start by downloading the source code. That way, you will not have the git repository of this project, and will be able to create a fresh one to manage your source files with it.

For a quick start, just ensure you have Podman and `make` installed and run `make`. The example available in the [presentation.md](./sources/presentation.md) file will be compiled into a PDF in `output/slides.pdf`. 

### Configuration

All the configuration happens within the `config` folder. The main configuration options are in the `config.yaml` file. This is where you'll find all the generic options. The general configuration options for your output are in the `metadata.yaml` file, including, titles, keywords, date, and more.

Configurations to a specific output format are into the file `<format>.yaml`. For example `beamer.yaml` regroups all the configuration options for the beamer format. 

### Writing your documents

You can store the documents you write in the `sources` folder. Be sure to include the documents in the `config.yaml` file in the order you want them to be processed. 

You can also store all your media inside the `media` folder (`sources` folder will also work). No need for relative paths when including your medias, as the `media` folder is already configured within `config.yaml` and Pandoc will find the resources automatically (e.g. use `![my image](./image.png)` will work even if `image.png` is in the `media` folder). You can also omit the file extension, or designate other source folders, if it is correctly configured in the configuration files.

Finally, you can add custom TeX in the header, body and end of body using the files present in the `includes` folder (e.g. when needing to use a specific front page template for a document).

### Building 

You're ready to build! You just need `make` installed and either:

- Pandoc and all of its dependencies for the technology you want to build for installed, or
- A container engine (e.g. Docker or Podman)

Then, to build with pandoc already install, use `make generate-bare`. If you prefer to use a container, add your eventual dependencies in the `Containerfile`, then `make build` to generate the container image and `make generate` to generate the document using the created container image. Note that Podman is the default and that you will need to change the first line of the `Makefile` to use Docker or another tool.

Your document is now ready in the `output` folder! 

### More examples

The course slides and associated lab subject available [here](https://gitlab.com/mh4ckt3mh4ckt1c4s/wasm-course-and-lab-tsp) have both been written using this framework. Feel free to browse them for an overview of what can be achieved with this framework.

## Troubleshoot

### Double parameters

Sometimes, there are multiple places where a parameter can be set. For example, adding a table of contents to the document can be either set in `config.yaml` (equivalent of the generic `--toc` option) or into the specific `latex.yaml` options. In order to adapt for all possible settings, these options are present in both files. Please note that the more specific configuration (here, `latex.yaml`) takes other the generic one. In case of a conflict or unexpected behavior, remember to comment out all the default configurations and keep only your own.

### The container image

At first, I wanted to use the official [pandoc container images available on DockerHub](https://hub.docker.com/u/pandoc). However, I encountered a few issues with these images (see [here](https://github.com/pandoc/dockerfiles/issues/198) and [here](https://github.com/pandoc/dockerfiles/issues/208)). They have not been updated for months which may cause issues when using the latest options of pandoc (which I did in my experiments). I tried to repackage a newer version of pandoc with their scripts without success. I also wanted a flexible and simple container image (so that people can easily add their dependencies inside the container) and was not focusing on being lightweight. That is why I finally switched to an Alpine container that packages pandoc and most of the libraries needed inside its repos.

If you have a problem of permissions, check that:

- The folder(s) and file(s) in which you are trying to read and write are existing
- The permissions of the files and inside the container are the same (no files owned by `root` in your repository for example). Also check the permissions of your container engine of you are using both rootful and rootless modes on your computer.

### More resources 

To be able to use fully this template, you will need to check the documentation of the various project it uses:

- the [pandoc documentation](https://pandoc.org/MANUAL.html)
- the documentation of the PDF engine you use, `pdflatex`, `lualatex` or other
- the Beamer documentation if you are creating presentations, available from [here](https://ctan.org/pkg/beamer) 

## Contribute

I'm happily taking feedbacks, issues and code contributions. This project is hosted on [GitLab](https://gitlab.com/mh4ckt3mh4ckt1c4s/pandoc-ultimate-template) and all the development happens here. Please do NOT open issues or other contributions on mirrors (GitHub or other) as they will be disregarded. 

## License 

This project is licensed under the MIT license. See the [LICENSE](LICENSE) for more information.

