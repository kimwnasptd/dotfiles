# install tree sitter cli
TREE_SITTER_VERSION="v0.26.3"
TREE_SITTER_BINARY="tree-sitter-linux-x64"

mkdir -p ~/.local/bin
wget https://github.com/tree-sitter/tree-sitter/releases/download/$TREE_SITTER_VERSION/$TREE_SITTER_BINARY.gz
echo "Un-zipping tree-sitter binary"

gunzip $TREE_SITTER_BINARY.gz
chmod +x $TREE_SITTER_BINARY

echo "Installing tree-sitter binary"
mv $TREE_SITTER_BINARY ~/.local/bin/tree-sitter
