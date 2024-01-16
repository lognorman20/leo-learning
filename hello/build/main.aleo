program hello.aleo;



function main:
    input r0 as u32.public;
    input r1 as u32.private;
    add r0 r1 into r2;
    output r2 as u32.private;


closure butter:
    input r0 as u32;
    input r1 as u32;
    mul r0 r1 into r2;
    output r2 as u32;


function cheese:
    input r0 as u32.private;
    input r1 as u32.private;
    call butter r0 r1 into r2;
    output r2 as u32.private;
