let [_, __, acc1, acc2] = process.argv

if(!acc1 || !acc2) {
	console.log('Please provide atleast two addresses as arguments')
	return 
}

acc1 = acc1.slice(2)
acc2 = acc2.slice(2)

const fs = require('fs')
const writeFile = (fileName, data) => { return fs.writeFileSync(fileName, JSON.stringify(data, null, 4)) }

const genesis = {
	config: {
		chainId: 12345,
		homesteadBlock: 0,
		eip150Block: 0,
		eip155Block: 0,
		eip158Block: 0,
		byzantiumBlock: 0,
		constantinopleBlock: 0,
		petersburgBlock: 0,
		istanbulBlock: 0,
		berlinBlock: 0,
		clique: {
			period: 5,
			epoch: 30000,
		},
	},
	difficulty: '1',
	gasLimit: '8000000',
	extradata:
		`0x0000000000000000000000000000000000000000000000000000000000000000${acc1}0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000`,
	alloc: {
		[acc1]: {balance: '300000'},
		[acc2]: {balance: '400000'},
	},
}

writeFile('genesis.json', genesis)
