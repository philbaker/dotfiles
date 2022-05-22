for f in `ls *.md`; do 
  pandoc -f markdown -t org -o ${f}.org ${f}; 
done
