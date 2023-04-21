# Ultimate pandoc framework

# Basic usage

All the configuration happens within the `config` folder.

The main configuration options are in the `config.yaml` file. This is where you'll find all the generic options. 

The general configuration options for your output are in the `metadata.yaml` file, including, titles, keywords, date, and more.

Then, configurations to a specific output format are into the file `<format>.yaml`. For example `beamer.yaml` regroups all the configuration options for the beamer format.

# Target

This ultimate template is aimed at producing LaTeX or Beamer-based PDF documents and presentation using pandoc. It can nevertheless be adapted to every input / output format supported by pandoc. It is using the XeLaTeX engine.

# Double parameters

Sometimes, there are multiple places where a parameter can be set. For example, adding a table of contents to the document can be either set in `config.yaml` (equivalent of the generic `--toc` option) or into the specific `latex.yaml` options. In order to adapt all possible settings, these options are present in both files. Please note that the more specific configuration (here, `latex.yaml`) takes other the generic one. In case of a conflict or unexpected behavior, remember to comment out all the other configurations and keep only your own.