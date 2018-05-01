#!/usr/bin/python2
import sys
from dictcc import Dict
from dictcc import Result

if len(sys.argv) != 4:
    print("Argument count is wrong")
    sys.exit()

from_lang = sys.argv[1]
to_lang = sys.argv[2]
search = sys.argv[3]

r = Dict.translate(word=search, from_language=from_lang, to_language=to_lang)

if r.n_results < 1:
    print("No match found")

for tin, tout in r.translation_tuples:
        print(("en: " + tin)).encode('utf-8')
        print(("de: " + tout)).encode('utf-8')
