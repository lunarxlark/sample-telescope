local sample_builtin = require'telescope._extensions.sample_builtin'

return require'telescope'.register_extension{
  exports = {
    colors = sample_builtin.colors,
  }
}
