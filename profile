export PYTHONPATH=$PWD:$PWD/ascent_jet:$PYTHONPATH
export PREVIEW_DIR=$PWD/ascent_jet/common/templates/preview
export DJANGO_SETTINGS_MODULE=ascent_jet.settings
export DATABASE_URL=postgres://ascent_jet:ascent_jetr3w@localhost:5432/ascent_jet
# export DATABASE_URL=sqlite:///$PWD/dev.sqlite
export BASE_DIR=$PWD
export DEBUG=True
workon ascent_jet