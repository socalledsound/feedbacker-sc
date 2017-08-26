// first store the synthdef
(
SynthDef("feedbacker",{|out=0,mul=1.0,fadeIn=0.1,playLength=0.1,fadeOut=0.1,fadeTail=0.3,resFreq=400,resQ=0.01|
	var env = EnvGen.ar(Env.new([0, 1, 1, 0.1,0], [fadeIn, playLength, fadeOut,fadeTail]), doneAction:2);
	var res = Resonz.ar(out,resFreq,resQ/10,10);
	Out.ar(out*mul*env,
		AudioIn.ar(1)
	)
}).store;
)




// then run this routine

(
Routine.run({

1000.do{

x=Synth("feedbacker",
			[\mul,rrand(0.3,1.0),
			\fadeTail,rrand(0.1,1.0),
			\resFreq,rrand(200,10)
			]
		);
		rrand(0.2,0.01).wait;
	}

})


)


