# Ultimate pandoc framework

## What is it ?

I'm a big fan of using [Pandoc](https://pandoc.org) to write quick Markdown and generate beautiful, TeX-based documents and presentations. However, for heavy customization, constant back and forth to the Pandoc documentation and managing a dirty `build.sh` file containing the Pandoc command with all its flags was too painful. 

That's why I created this Pandoc framework, allowing to easily configure and use Pandoc with YAML files and a container-based reproducible and distributable build system. This framework is aimed at producing TeX or Beamer-based PDF documents and presentations. It can nevertheless be easily adapted to every input / output format supported by Pandoc.

## Basic usage

Start by cloning this project. 

### Configuration

All the configuration happens within the `config` folder. The main configuration options are in the `config.yaml` file. This is where you'll find all the generic options. The general configuration options for your output are in the `metadata.yaml` file, including, titles, keywords, date, and more.

Configurations to a specific output format are into the file `<format>.yaml`. For example `beamer.yaml` regroups all the configuration options for the beamer format. 

### Writing your documents

You can store the documents you write in the `sources` folder. Be sure to include the documents in the `config.yaml` file in the order you want them to be processed. 

You can also store all your media inside the `media` folder (`sources` folder will also work). No need for relative paths when including your medias, as the `media` folder is already configured within `config.yaml` and Pandoc will find the resources automatically (e.g. use `![my image](./image.png)` will work even if `image.png` is in the `media` folder). 

Finally, you can add custom TeX in the header, body and end of body using the files present in the `includes` folder (e.g. when needing to use a specific front page template for a document).

### Building 

You're ready to build ! You juste need `make` installed and either :

- Pandoc and all of its dependencies for the technology you want to build for installed, or
- A container engine (e.g. Docker or Podman)

Then, to build with Pandoc already install, use `make generate-bare`. If you prefer to use a container, add your eventual dependencies in the `Containerfile`, then `make build` to generate the container image and `make generate` to generate the document using the created container image. Note that Podman is the default and that you will need to change the first line of the `Makefile` to use Docker or another tool.

Your document is now ready in the `output` folder ! 

## Troubleshoot

### Double parameters

Sometimes, there are multiple places where a parameter can be set. For example, adding a table of contents to the document can be either set in `config.yaml` (equivalent of the generic `--toc` option) or into the specific `latex.yaml` options. In order to adapt for all possible settings, these options are present in both files. Please note that the more specific configuration (here, `latex.yaml`) takes other the generic one. In case of a conflict or unexpected behavior, remember to comment out all the default configurations and keep only your own.

## Contribute

## License 

# Explanation of config, set / unset yaml files according to options
# Explanation of pandoc container image problems
# Licenses
# Beamer, pandoc and latex doc