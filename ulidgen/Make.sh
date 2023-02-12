#!/bin/sh
TARGET=nnulidgen

ocamlfind ocamlopt -o ${TARGET} -linkpkg -package ulid ulidgen.ml
install -m 700 ${TARGET} ../
rm ${TARGET}
