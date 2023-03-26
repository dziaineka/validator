use rustler::{Env, Term};

#[rustler::nif]
pub fn validate(left: usize, right: usize) -> usize {
    left + right
}

fn on_load(_env: Env, _: Term) -> bool {
    // rustler::resource!(FileResource, env);
    true
}

rustler::init!("xml_validator", [validate], load = on_load);
