echo "Redo old queue items"
make warm A='redooldqueue 1'

echo "Remove completed queue items"
make warm A='clean 1'
