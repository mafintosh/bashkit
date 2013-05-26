# Bashkit

Make command-line apps in bash in no time will full autocompletion and command routing support

## Installation

Run the following command to install bashkit

	curl https://raw.github.com/mafintosh/bashkit/master/install | sh && . ~/.bashkit/bashrc

This will install a commandline tool called `bashkit`.
Run `bashkit` to print all available options

## My first app

After you installed `bashkit` you can start making your own command-line apps.
The following program will print hello world

``` sh
#!/bin/bash
. $(bashkit path) # include bashkit in this program

cmd-hello () {
	# this is the hello command
	echo hello world
}

run # call run to bootstrap the program
```

Save the following file as `my-first-app` and run `bashkit link my-first-app` in the same folder.
Afterwards you should be able to run `my-first-app hello` in your terminal and it should print `hello world`

Similary you could a add a command called `hi` by defining a `cmd-hi` method

## Adding options

You can add command-line options by using the `opt` function

``` sh
#!/bin/bash
. $(bashkit path) # include bashkit in this program

opt world w # lets add a --world (-w for short) option to our

cmd-hello () {
	opt world || exit 1 # if --world is not set exit
	echo hello $opt_world # the world argument is available in through a env var
}

run
```

Running the above program with `my-first-app hello --world world` will print `hello world`

## Autocompletion

All linked apps features autocompletion of commands and options.
This means that typing `my-first-app <tab><tab>` in the terminal will print out available options

If you want to enable autocompletion of your command-line option values or command arguments you need
to define a custom tab completion method

``` sh
#!/bin/bash
. $(bashkit path) # include bashkit in this program

opt world w # lets add a --world (-w for short) option to our

# lets autocomplete the --world option
tab-world () {
	echo world welt verden mundo # print out available options
}

cmd-hello () {
	opt world || exit 1 # if --world is not set exit
	echo hello $opt_world # the world argument is available in through a env var
}

run
```

Running `my-first-app hello --world <tab><tab>` will give you the above options now

## License

MIT