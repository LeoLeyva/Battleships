#!/bin/bash
# DO NOT EDIT THIS FILE

environment=good
OPAMV=2.*
OCAMLV=4.09.*
OUNITV=2.*




OCAMLC_VERSION="$(ocamlc --version 2>&1)"
if [[ $OCAMLC_VERSION == $OCAMLV ]]; then
  echo "OCaml compiler version $OCAMLV is active.  Good."
else
  echo "OCaml compiler version $OCAMLV is NOT active.  This is bad."
  echo "The active version is: $OCAMLC_VERSION"
  environment=bad
fi


OUNIT_VERSION="$(opam info ounit -f version 2>&1)"
if [[ $OUNIT_VERSION =~ $OUNITV ]]; then
  echo "OUnit version $OUNITV is active.  Good."
else
  echo "OUnit version $OUNITV is NOT active.  This is bad."
  echo "The active version of OUnit is: $OUNIT_VERSION"
  environment=bad
fi

if [[ $environment == good ]]; then
  cat <<EOF
===========================================================
Your OCaml environment looks good to me.  Congratulations!
===========================================================
EOF
else
  cat <<EOF
===========================================================
WARNING

Your OCaml environment looks broken to me.  Check the error 
messages above carefully to determine what is wrong with 
your environment.  Please see a consultant for help if you 
cannot determine what is wrong.
===========================================================
EOF
fi
