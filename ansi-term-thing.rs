use ansi_term::Colour::{Red, Blue};

fn main() {
    println!("{} {} {}", Red.paint("ERROR:"), ("Oh no."), Blue.paint("???"));
}
