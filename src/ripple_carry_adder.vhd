library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration for the ripple carry adder
entity ripple_carry_adder is
    generic (
        N : integer := 4  -- Default number of bits, can be changed
    );
    port (
        A : in  STD_LOGIC_VECTOR(N-1 downto 0);  -- Input A
        B : in  STD_LOGIC_VECTOR(N-1 downto 0);  -- Input B
        Cin : in  STD_LOGIC;                      -- Carry input
        Sum : out  STD_LOGIC_VECTOR(N-1 downto 0);-- Sum output
        Cout : out  STD_LOGIC                     -- Carry output
    );
end ripple_carry_adder;

-- Architecture declaration for the ripple carry adder
architecture Behavioral of ripple_carry_adder is

    -- Internal signal for carry propagation
    signal C : STD_LOGIC_VECTOR(N downto 0);

begin

    -- Initial carry input
    C(0) <= Cin;

    -- Generate block to create the ripple carry adder logic
    gen_adder : for i in 0 to N-1 generate
        -- Full adder instance for each bit position
        process(A, B, C)
        begin
            Sum(i) <= A(i) xor B(i) xor C(i);
            C(i+1) <= (A(i) and B(i)) or (A(i) and C(i)) or (B(i) and C(i));
        end process;
    end generate gen_adder;

    -- Output the final carry out
    Cout <= C(N);

end Behavioral;
