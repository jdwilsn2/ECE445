
/*
 * Simple gain operation - set the amplitude of the now-clipped
 * signal based on the user parameter Volume. Phase 2 of the fully
 * combinational distortion unit.
 */

module driver (input 			[23:0] D_Clipped,	 // signal from clipper unit
				   input				[7:0] Volume,	    // raw digital value from user-set pot
					output logic 	[23:0] D_Boosted); // output to peak filter module
					
	logic	[7:0] Lookup_Volume;
	logic [23:0] Magnitude_D_Clipped;
	logic	[31:0] D_Product, Magnitude_D_Product;
	
	always_comb
	begin
	
			case (Volume)
				8'd9  : Lookup_Volume = 8'd1;
				8'd10 : Lookup_Volume = 8'd1;
				8'd11 : Lookup_Volume = 8'd1;
				8'd12 : Lookup_Volume = 8'd1;
				8'd13 : Lookup_Volume = 8'd1;
				8'd14 : Lookup_Volume = 8'd1;
				8'd15 : Lookup_Volume = 8'd1;
				8'd16 : Lookup_Volume = 8'd1;
				8'd17 : Lookup_Volume = 8'd1;
				8'd18 : Lookup_Volume = 8'd1;
				8'd19 : Lookup_Volume = 8'd1;
				8'd20 : Lookup_Volume = 8'd1;
				8'd21 : Lookup_Volume = 8'd1;
				8'd22 : Lookup_Volume = 8'd1;
				8'd23 : Lookup_Volume = 8'd1;
				8'd24 : Lookup_Volume = 8'd2;
				8'd25 : Lookup_Volume = 8'd2;
				8'd26 : Lookup_Volume = 8'd2;
				8'd27 : Lookup_Volume = 8'd2;
				8'd28 : Lookup_Volume = 8'd2;
				8'd29 : Lookup_Volume = 8'd2;
				8'd30 : Lookup_Volume = 8'd2;
				8'd31 : Lookup_Volume = 8'd2;
				8'd32 : Lookup_Volume = 8'd2;
				8'd33 : Lookup_Volume = 8'd2;
				8'd34 : Lookup_Volume = 8'd2;
				8'd35 : Lookup_Volume = 8'd2;
				8'd36 : Lookup_Volume = 8'd3;
				8'd37 : Lookup_Volume = 8'd3;
				8'd38 : Lookup_Volume = 8'd3;
				8'd39 : Lookup_Volume = 8'd3;
				8'd40 : Lookup_Volume = 8'd3;
				8'd41 : Lookup_Volume = 8'd3;
				8'd42 : Lookup_Volume = 8'd3;
				8'd43 : Lookup_Volume = 8'd3;
				8'd44 : Lookup_Volume = 8'd4;
				8'd45 : Lookup_Volume = 8'd4;
				8'd46 : Lookup_Volume = 8'd4;
				8'd47 : Lookup_Volume = 8'd4;
				8'd48 : Lookup_Volume = 8'd4;
				8'd49 : Lookup_Volume = 8'd4;
				8'd50 : Lookup_Volume = 8'd4;
				8'd51 : Lookup_Volume = 8'd4;
				8'd52 : Lookup_Volume = 8'd5;
				8'd53 : Lookup_Volume = 8'd5;
				8'd54 : Lookup_Volume = 8'd5;
				8'd55 : Lookup_Volume = 8'd5;
				8'd56 : Lookup_Volume = 8'd5;
				8'd57 : Lookup_Volume = 8'd5;
				8'd58 : Lookup_Volume = 8'd5;
				8'd59 : Lookup_Volume = 8'd5;
				8'd60 : Lookup_Volume = 8'd6;
				8'd61 : Lookup_Volume = 8'd6;
				8'd62 : Lookup_Volume = 8'd6;
				8'd63 : Lookup_Volume = 8'd6;
				8'd64 : Lookup_Volume = 8'd6;
				8'd65 : Lookup_Volume = 8'd6;
				8'd66 : Lookup_Volume = 8'd7;
				8'd67 : Lookup_Volume = 8'd7;
				8'd68 : Lookup_Volume = 8'd8;
				8'd69 : Lookup_Volume = 8'd8;
				8'd70 : Lookup_Volume = 8'd8;
				8'd71 : Lookup_Volume = 8'd9;
				8'd72 : Lookup_Volume = 8'd9;
				8'd73 : Lookup_Volume = 8'd9;
				8'd74 : Lookup_Volume = 8'd10;
				8'd75 : Lookup_Volume = 8'd10;
				8'd76 : Lookup_Volume = 8'd10;
				8'd77 : Lookup_Volume = 8'd10;
				8'd78 : Lookup_Volume = 8'd10;
				8'd79 : Lookup_Volume = 8'd11;
				8'd80 : Lookup_Volume = 8'd11;
				8'd81 : Lookup_Volume = 8'd11;
				8'd82 : Lookup_Volume = 8'd12;
				8'd83 : Lookup_Volume = 8'd12;
				8'd84 : Lookup_Volume = 8'd13;
				8'd85 : Lookup_Volume = 8'd13;
				8'd86 : Lookup_Volume = 8'd14;
				8'd87 : Lookup_Volume = 8'd14;
				8'd88 : Lookup_Volume = 8'd15;
				8'd89 : Lookup_Volume = 8'd16;
				8'd90 : Lookup_Volume = 8'd16;
				8'd91 : Lookup_Volume = 8'd17;
				8'd92 : Lookup_Volume = 8'd18;	
				8'd93 : Lookup_Volume = 8'd18;
				8'd94 : Lookup_Volume = 8'd19;	
				8'd95 : Lookup_Volume = 8'd19;
				8'd96 : Lookup_Volume = 8'd20;
				8'd97 : Lookup_Volume = 8'd21;
				8'd98 : Lookup_Volume = 8'd22;	
				8'd99 : Lookup_Volume = 8'd23;
				8'd100 : Lookup_Volume = 8'd24;
				8'd101 : Lookup_Volume = 8'd25;
				8'd102 : Lookup_Volume = 8'd25;
				8'd103 : Lookup_Volume = 8'd26;
				8'd104 : Lookup_Volume = 8'd27;
				8'd105 : Lookup_Volume = 8'd28;
				8'd106 : Lookup_Volume = 8'd29;
				8'd107 : Lookup_Volume = 8'd30;
				8'd108 : Lookup_Volume = 8'd32;
				8'd109 : Lookup_Volume = 8'd33;
				8'd110 : Lookup_Volume = 8'd34;
				8'd111 : Lookup_Volume = 8'd35;
				8'd112 : Lookup_Volume = 8'd36;
				8'd113 : Lookup_Volume = 8'd37;
				8'd114 : Lookup_Volume = 8'd39;
				8'd115 : Lookup_Volume = 8'd40;
				8'd116 : Lookup_Volume = 8'd42;
				8'd117 : Lookup_Volume = 8'd44;
				8'd118 : Lookup_Volume = 8'd45;
				8'd119 : Lookup_Volume = 8'd47;
				8'd120 : Lookup_Volume = 8'd48;
				8'd121 : Lookup_Volume = 8'd50;
				8'd122 : Lookup_Volume = 8'd52;
				8'd123 : Lookup_Volume = 8'd54;
				8'd124 : Lookup_Volume = 8'd55;
				8'd125 : Lookup_Volume = 8'd58;
				8'd126 : Lookup_Volume = 8'd61;
				8'd127 : Lookup_Volume = 8'd64;
				8'd128 : Lookup_Volume = 8'd65;
				8'd129 : Lookup_Volume = 8'd66;
				8'd130 : Lookup_Volume = 8'd66;
				8'd131 : Lookup_Volume = 8'd67;
				8'd132 : Lookup_Volume = 8'd67;
				8'd133 : Lookup_Volume = 8'd68;
				8'd134 : Lookup_Volume = 8'd68;
				8'd135 : Lookup_Volume = 8'd69;
				8'd136 : Lookup_Volume = 8'd70;
				8'd137 : Lookup_Volume = 8'd70;
				8'd138 : Lookup_Volume = 8'd71;
				8'd139 : Lookup_Volume = 8'd72;
				8'd140 : Lookup_Volume = 8'd72;
				8'd141 : Lookup_Volume = 8'd73;
				8'd142 : Lookup_Volume = 8'd73;
				8'd143 : Lookup_Volume = 8'd74;
				8'd144 : Lookup_Volume = 8'd75;
				8'd145 : Lookup_Volume = 8'd76;
				8'd146 : Lookup_Volume = 8'd76;
				8'd147 : Lookup_Volume = 8'd77;
				8'd148 : Lookup_Volume = 8'd77;
				8'd149 : Lookup_Volume = 8'd78;
				8'd150 : Lookup_Volume = 8'd78;
				8'd151 : Lookup_Volume = 8'd79;
				8'd152 : Lookup_Volume = 8'd80;
				8'd153 : Lookup_Volume = 8'd81;
				8'd154 : Lookup_Volume = 8'd81;
				8'd155 : Lookup_Volume = 8'd82;
				8'd156 : Lookup_Volume = 8'd83;
				8'd157 : Lookup_Volume = 8'd83;
				8'd158 : Lookup_Volume = 8'd84;
				8'd159 : Lookup_Volume = 8'd85;
				8'd160 : Lookup_Volume = 8'd86;
				8'd161 : Lookup_Volume = 8'd87;
				8'd162 : Lookup_Volume = 8'd88;
				8'd163 : Lookup_Volume = 8'd89;
				8'd164 : Lookup_Volume = 8'd89;
				8'd165 : Lookup_Volume = 8'd90;
				8'd166 : Lookup_Volume = 8'd91;
				8'd167 : Lookup_Volume = 8'd92;
				8'd168 : Lookup_Volume = 8'd93;
				8'd169 : Lookup_Volume = 8'd94;
				8'd170 : Lookup_Volume = 8'd95;
				8'd171 : Lookup_Volume = 8'd96;
				8'd172 : Lookup_Volume = 8'd96;
				8'd173 : Lookup_Volume = 8'd97;
				8'd174 : Lookup_Volume = 8'd98;
				8'd175 : Lookup_Volume = 8'd99;
				8'd176 : Lookup_Volume = 8'd100;
				8'd177 : Lookup_Volume = 8'd101;
				8'd178 : Lookup_Volume = 8'd102;
				8'd179 : Lookup_Volume = 8'd103;
				8'd180 : Lookup_Volume = 8'd103;
				8'd181 : Lookup_Volume = 8'd104;
				8'd182 : Lookup_Volume = 8'd105;
				8'd183 : Lookup_Volume = 8'd106;
				8'd184 : Lookup_Volume = 8'd107;
				8'd185 : Lookup_Volume = 8'd108;
				8'd186 : Lookup_Volume = 8'd109;
				8'd187 : Lookup_Volume = 8'd110;
				8'd188 : Lookup_Volume = 8'd111;
				8'd189 : Lookup_Volume = 8'd112;
				8'd190 : Lookup_Volume = 8'd113;
				8'd191 : Lookup_Volume = 8'd114;
				8'd192 : Lookup_Volume = 8'd115;	
				8'd193 : Lookup_Volume = 8'd116;
				8'd194 : Lookup_Volume = 8'd117;	
				8'd195 : Lookup_Volume = 8'd118;
				8'd196 : Lookup_Volume = 8'd119;
				8'd197 : Lookup_Volume = 8'd120;
				8'd198 : Lookup_Volume = 8'd121;	
				8'd199 : Lookup_Volume = 8'd122;
				8'd200 : Lookup_Volume = 8'd123;
				8'd201 : Lookup_Volume = 8'd124;
				8'd202 : Lookup_Volume = 8'd125;
				8'd203 : Lookup_Volume = 8'd126;
				8'd204 : Lookup_Volume = 8'd127;
				8'd205 : Lookup_Volume = 8'd128;
				8'd206 : Lookup_Volume = 8'd129;
				8'd207 : Lookup_Volume = 8'd131;
				8'd208 : Lookup_Volume = 8'd132;
				8'd209 : Lookup_Volume = 8'd134;
				8'd210 : Lookup_Volume = 8'd135;
				8'd211 : Lookup_Volume = 8'd136;
				8'd212 : Lookup_Volume = 8'd138;
				8'd213 : Lookup_Volume = 8'd139;
				8'd214 : Lookup_Volume = 8'd140;
				8'd215 : Lookup_Volume = 8'd141;
				8'd216 : Lookup_Volume = 8'd143;
				8'd217 : Lookup_Volume = 8'd144;
				8'd218 : Lookup_Volume = 8'd146;
				8'd219 : Lookup_Volume = 8'd147;
				8'd220 : Lookup_Volume = 8'd149;
				8'd221 : Lookup_Volume = 8'd150;
				8'd222 : Lookup_Volume = 8'd151;
				8'd223 : Lookup_Volume = 8'd152;
				8'd224 : Lookup_Volume = 8'd154;
				8'd225 : Lookup_Volume = 8'd155;
				8'd226 : Lookup_Volume = 8'd157;
				8'd227 : Lookup_Volume = 8'd158;
				8'd228 : Lookup_Volume = 8'd160;
				8'd229 : Lookup_Volume = 8'd161;
				8'd230 : Lookup_Volume = 8'd162;
				8'd231 : Lookup_Volume = 8'd163;
				8'd232 : Lookup_Volume = 8'd165;
				8'd233 : Lookup_Volume = 8'd166;
				8'd234 : Lookup_Volume = 8'd168;
				8'd235 : Lookup_Volume = 8'd169;
				8'd236 : Lookup_Volume = 8'd171;
				8'd237 : Lookup_Volume = 8'd172;
				8'd238 : Lookup_Volume = 8'd174;
				8'd239 : Lookup_Volume = 8'd175;
				8'd240 : Lookup_Volume = 8'd177;
				8'd241 : Lookup_Volume = 8'd179;
				8'd242 : Lookup_Volume = 8'd181;
				8'd243 : Lookup_Volume = 8'd182;
				8'd244 : Lookup_Volume = 8'd184;
				8'd245 : Lookup_Volume = 8'd185;
				8'd246 : Lookup_Volume = 8'd187;
				8'd247 : Lookup_Volume = 8'd188;
				8'd248 : Lookup_Volume = 8'd190;
				8'd249 : Lookup_Volume = 8'd192;
				8'd250 : Lookup_Volume = 8'd194;
				8'd251 : Lookup_Volume = 8'd195;
				8'd252 : Lookup_Volume = 8'd197;
				8'd253 : Lookup_Volume = 8'd199;
				8'd254 : Lookup_Volume = 8'd200;
				8'd255 : Lookup_Volume = 8'd202;	
				default : Lookup_Volume = 8'd0;
			endcase
			
			Magnitude_D_Clipped = ~(D_Clipped) + 1'b1;
			Magnitude_D_Product = Magnitude_D_Clipped * Lookup_Volume;
			D_Product = D_Clipped * Lookup_Volume;
			
			if (~(D_Clipped[23]))
			begin
				D_Boosted = D_Product[29:6];
				if ((D_Boosted[23] != D_Clipped[23]) && ~(D_Clipped[23]))
					D_Boosted = 24'h7fffff;
			end

			else
			begin
				D_Boosted = ~(Magnitude_D_Product[29:6]) + 1'b1;
				if (((D_Boosted[23] != D_Clipped[23])) && (D_Clipped[23]) && (D_Boosted))
					D_Boosted = 24'h800001;
			end
			
	
	end
	
endmodule


	
	
	
	
		