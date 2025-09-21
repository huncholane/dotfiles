vim.cmd([[
let current_compiler="rust_verbose"
set makeprg=RUST_BACKTRACE=1\ cargo

"   4: tests::utils::test_pairing
"             at ./tests/utils.rs:232:5
set efm=%E\ %#%n:\ %m,%Z\ %#at\ /%.%#
set efm+=%E\ %#%n:\ %m,%Z\ %#at\ \./%f:%l:%c

"thread 'time_period::y2023::m11nov_tests::test_2023_Nov_B767_MEM' panicked at tests/utils.rs:232:5:
"assertion `left == right` failed: Incorrect end at zulu for line 1001 / pairing 137. 
"Expect 2023-11-11 02:53:00 UTC 
"Result: 2023-11-11 01:20:00 UTC
"
"  left: 2023-11-11T01:20:00Z
" right: 2023-11-11T02:53:00Z
"stack backtrace:
set efm+=%Ethread\ '%m'\ panicked\ at\ %f:%l:%c:
]])
