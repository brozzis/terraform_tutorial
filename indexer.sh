for i in 0?? ; do T=$(head -1 $i/README.md|cut -c4-); echo  "- [$T]($i/README.md) " ; done
