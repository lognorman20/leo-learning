// The 'hello' program.
program hello.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }

    transition cheese(public a: u32, b: u32) -> u32 {
        return a * b;
    }
}
