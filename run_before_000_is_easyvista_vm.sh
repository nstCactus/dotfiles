#!/bin/bash

if id coadmin &>/dev/null; then
  export IS_EASYVISTA_VM=true
else
  export IS_EASYVISTA_VM=false
fi
