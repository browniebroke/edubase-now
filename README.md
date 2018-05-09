# Edubase API

Convert the daily [Edubase dump](https://get-information-schools.service.gov.uk/Downloads) 
into an API in seconds.

## How to use

Python dependencies are installed using [pipenv](https://docs.pipenv.org/),
you might need to install it if you don't have it. Otherwise, install them
using:

```bash
pipenv install
```

Make sure you're in the virtual environment:

```bash
pipenv shell
```

Commands are wrapped in a Makefile, which comes pre-installed if you're on
a Unix based system. They all assume the virtual environment is activated.
Then, the Makefile help* is pretty self-explanatory:

```bash
> make help
  build                     Pre-build the required assets
  clean                     Clean any previously downloaded data
  deploy                    Deploy to Heroku
  download                  Download the csv file from Edubase
  help                      Display this help message
  serve                     Serve the dataset in your browser
```

_(*) Thanks to [Ned Batchelder](https://nedbatchelder.com/) for introducing me 
to [this neat trick to generate Makefile help text](https://nedbatchelder.com//blog/201804/makefile_help_target.html)_

## Credits

[Simon Willison](https://twitter.com/simonw) who wrote these 2 amazing tools:

- [csv-to-sqlite](https://github.com/simonw/csvs-to-sqlite) to turn dump into a SQLite database
- [Datasette](https://github.com/simonw/datasette) to serve this database
