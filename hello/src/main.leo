// The 'hello' program.
program hello.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }

    function butter(a: u32, b: u32) -> u32 {
        return a * b;
    }

    transition cheese(private a: u32, private b: u32) -> u32 {
        return butter(a, b);
    }
}
