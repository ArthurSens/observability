//+build tools

// Package tools tracks dependencies for tools that used in the build process.
// See https://github.com/golang/go/wiki/Modules
package tools

import (
	_ "github.com/bwplotka/mdox"
	_ "github.com/armosec/kubescape"
)