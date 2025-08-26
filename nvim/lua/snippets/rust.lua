local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
  -- Derive macro skeleton
  s("pmd", {
    t({
      "#[proc_macro_derive(",
    }),
    i(1, "MyDerive"),
    t({ ")]", "pub fn " }),
    i(2, "my_derive"),
    t({
      "(input: proc_macro::TokenStream) -> proc_macro::TokenStream {",
      "    let input = syn::parse_macro_input!(input as syn::DeriveInput);",
      "    let name = &input.ident;",
      "",
      "    quote! {",
      "        // generated code here",
      "    }.into()",
      "}",
    }),
  }),

  -- Attribute macro skeleton
  s("pma", {
    t({
      "#[proc_macro_attribute]",
      "pub fn ",
    }),
    i(1, "with_field"),
    t({
      "(_attr: proc_macro::TokenStream, item: proc_macro::TokenStream) -> proc_macro::TokenStream {",
      "    let ast = syn::parse_macro_input!(item as syn::ItemStruct);",
      "    // modify ast.fields here",
      "    proc_macro::TokenStream::from(quote!(#ast))",
      "}",
    }),
  }),

  --- Procedural macro attr expand function
  s({
    trig = "pmae",
    name = "Proc Macro Attr Expand",
    dscr = "Boilerplate for expansion function to be used later in a #[proc_macro_attribute]",
  }, {
    t({
      "pub fn expand(",
      "\tattr: proc_macro::TokenStream,",
      "\titem: proc_macro::TokenStream,",
      ") -> proc_macro::TokenStream {",
      "\tlet ast = syn::parse_macro_input!(item as syn::ItemStruct);",
      "\tquote::quote! {}",
      "}",
    }),
  }),

  --- Procedural macro derive expand function
  s({
    trig = "pmde",
    name = "Proc Macro Derive Expand",
    dscr = "Boilerplate for expansion function to be used later in #[proc_macro_derive]",
  }, {
    t({
      "pub fn expand(item: proc_macro::TokenStream) -> proc_macro::TokenStream {",
      "\tlet input = syn::parse_macro_input!(item as syn::DeriveInput);",
      "\tquote::quote! {}.into()",
      "}",
    }),
  }),

  --- Procedural macro attr import function
  s({
    trig = "pmai",
    name = "Proc Macro Attr Import",
    dscr = "Used to import procedural macro defined in another function with pmae",
  }, {
    t({
      "#[proc_macro_attribute]",
      "pub fn with_",
    }),
    i(1, "import"),
    t({
      "(",
      "\tattr: proc_macro::TokenStream,",
      "\titem: proc_macro::TokenStream,",
      ") -> proc_macro::TokenStream {",
      "\t",
    }),
    rep(1),
    t({
      "::expand(attr, item)",
      "}",
    }),
  }),

  --- Procedural macro derive import function
  s({
    trig = "pmdi",
    name = "Proc Macro Derive Import",
    dscr = "Used to import from another file with pmde",
  }, {
    t({
      "#[proc_macro_derive(",
    }),
    i(1, "MyDerive"),
    t({ ")]", "pub fn derive" }),
    i(2, "import"),
    t({
      "(item: proc_macro::TokenStream) -> proc_macro::TokenStream {",
      "\t",
    }),
    rep(2),
    t({
      "::expand(item)",
      "}",
    }),
  }),
}
