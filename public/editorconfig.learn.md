## Managing Code Style on a Directory Level with EditorConfig

https://blog.jetbrains.com/idea/2019/06/managing-code-style-on-a-directory-level-with-editorconfig/



## My Configuration

`ij_` prefix stands for IntelliJ.

```toml
# top-most EditorConfig file
root = true

[*]
indent_style = space
indent_size = 4
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.php]
ij_php_space_before_closure_left_parenthesis = false

[*.{json,yml,txt,md,sql}]
indent_size = 2

[*.{xml,xlf,xsd}]
indent_size = 2

[htdocs/typo3conf/ext/speciality/Resources/Public/JavaScript/*.js]
ij_any_array_initializer_new_line_after_left_brace = false
ij_javascript_force_semicolon_style = true
ij_javascript_use_semicolon_after_statement = false
ij_javascript_space_before_function_left_parenth = false
ij_javascript_force_quote_style = true
ij_javascript_use_double_quotes = false
```

