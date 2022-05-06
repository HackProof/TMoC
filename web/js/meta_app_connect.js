if(typeof web3 !== "undefined"){
  web3 = new Web3(web3.currentProvider);
  console.log("Metamask connected");
  ethereum.request({ method: 'eth_requestAccounts' });
} else {
  console.log("No Metamask");
}

//input contract address
const contractAddress = "0xEB8e9539687BaD3bBf510592d658C35F1566CC70";

const smartContract = web3.eth.contract(abi).at(contractAddress);