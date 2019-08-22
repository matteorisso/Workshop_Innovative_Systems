library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all ;

entity carrySelectBlock is
  
  generic 	(	nBits : 		integer := 4
  			);

  port 		(   cIn   : in 		std_logic;
          		dataA : in 		signed(nBits-1 downto 0);
          		dataB : in 		signed(nBits-1 downto 0);
          		sum   : out 	signed(nBits-1 downto 0)
       		);
end entity;

architecture structural of carrySelectBlock is
  
  signal s1 : signed(nBits-1 downto 0);
  signal s2 : signed(nBits-1 downto 0);
  
  component MUX21_GENERIC is
    
 	Generic (	NBIT 	: 			integer:= 4

 			);	
    Port 	(	A 		:	In		signed(NBIT-1 downto 0);
				B 		:	In		signed(NBIT-1 downto 0);
		    	SEL 	:	In		std_logic;
		   		Y 		:	Out		signed(NBIT-1 downto 0)
		  	);
  end component;
  
  component RCA is 

	generic ( 	nBits 	:  			Integer := 4

			);
	Port 	(	A 		:	In		signed(nBits-1 downto 0);
		        B 		:	In		signed(nBits-1 downto 0);
        	  	Ci 		:	In		std_logic;
        	  	S 		:	Out		signed(nBits-1 downto 0);
      		  	Co 		:	Out		std_logic);
  end component; 
  
  begin
    
    -- adder with carry input equals to 0
    rca0 : RCA 	generic map 	( 	nBits => nBits)

    			port map		(  	A => dataA,
                          			B => dataB,
                          			Ci => '0',
                          			S => s1
                        		);
    
    -- adder with carry input equals to 1                
    rca1 : rca 	generic map 	( 	nBits => nBits)

    			port map		(  	A => dataA,
                          			B => dataB,
    		                      	Ci => '1',
                          			S => s2
                        		);	
    
    -- mux to select the right sum depending on the carry input
    mux : MUX21_GENERIC 	generic map 	( 	NBIT => nBits)

    						port map		(	A => s2,
    	                              			B => s1,
        	    			                    SEL => cIn,
            	                    			Y => sum
                                			);
end architecture;

configuration cfg_carry_select_block of carrySelectBlock is
	for structural
	 for rca0 : RCA
	   use configuration work.cfg_rca_structural;
	 end for;
	 for rca1 : RCA
	   use configuration work.cfg_rca_structural;
	 end for;
	 for mux : MUX21_GENERIC
	   use configuration work.cfg_mux21_gen_behavioral;
	 end for;
	end for;
end cfg_carry_select_block;