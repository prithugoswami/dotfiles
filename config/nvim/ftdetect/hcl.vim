silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
autocmd BufNewFile,BufRead *.hcl set filetype=hcl

" Nomad
autocmd BufNewFile,BufRead *.nomad set filetype=hcl

" Terraform
autocmd BufNewFile,BufRead *.tf     set filetype=hcl
autocmd BufNewFile,BufRead *.tfvars set filetype=hcl
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
