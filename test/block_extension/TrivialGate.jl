using YaoExtensions, Yao
using Random, Test

@testset "EchoBlock" begin
    block = EchoBlock(4, :Test)
    reg = rand_state(4)
    @test reg |> block == reg
    @test mat(block) != nothing
    @test ishermitian(block)
    @test isreflexive(block)
    @test isunitary(block)
    @test getiparams(block) == ()

    @test EchoBlock()(5) isa EchoBlock{5, Base.TTY}
    @test EchoBlock()(5).sym == :ECHO
end
