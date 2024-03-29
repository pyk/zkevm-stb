# Staking The Bridge by Polygon ZkEVM

Source code for Staking The Bridge project by Polygon ZkEVM.

## Contracts

### L1Escrow

- L1Escrow receive ERC-20 from users on L1 and trigger a mint of the L2Token on L2
  via LxLy bridge.
- L1Escrow hold the backing for ERC-20 and contain the investment logic.
- L1Escrow is upgradable.
- Roles:
  - **Admin**
    - Ability to upgrade the contract
    - Ability to pause the contract
    - Ability to grant/revoke roles
  - **EscrowManager**
    - Ability to withdraw ERC-20 tokens from backing
- Follow the ERC-20 Mintable Interface supported by Polygon Portal

### L2Token

- This contract is the ERC-20 on L2.
- L2Token is upgradable.
- Roles:
  - **Admin**
    - Ability to upgrade the contract
    - Ability to pause the contract
    - Ability to grant/revoke roles
  - **Escrow**
    - Ability to mint and burn token via `bridgeMint` and `bridgeBurn`
  - **Converter**
    - Ability to mint and burn token via `converterMint` and `converterBurn`

### L2Escrow

- This contract is responsible for receive cross-chain message from
  L1Escrow then mint L2Token
- L2Escrow receive L2Token from users on L2 and trigger a release of the TKN
  on L1 via LxLy.
- L2Escrow is upgradable.
- Roles:
  - **Admin**
    - Ability to upgrade the contract
    - Ability to pause the contract
- Follow the ERC-20 Mintable Interface supported by Polygon Portal

### L2TokenConverter

- User can deposit ERC-20 to L2TokenConverter in exchange for L2Token via `deposit`
- User can withdraw ERC-20 by burning L2Token via `withdraw`
- L2TokenConverter is upgradable.
- Roles:
  - **Admin**
    - Ability to upgrade the contract
    - Ability to pause the contract
    - Ability to grant/revoke roles
  - **EscrowManager**
    - Ability to withdraw ERC-20 tokens
  - **RiskManager**
    - Ability to change issue cap
- Escrow manager can withdraw the ERC-20 inside L2TokenConverter via `managerWithdraw`
  function
- Risk manager can increase or reduce the issuance cap of the ERC-20 <-> L2Token
  via `setIssuanceCap`

## Development

Install latest version of [foundry](https://github.com/foundry-rs/foundry).

Install dependencies:

```shell
forge install
```

Create `.env` file with the following content:

```shell
ETH_RPC_URL="https://ethereum.publicnode.com"
ZKEVM_RPC_URL="https://zkevm-rpc.com"
```

Run the test:

```shell
forge test
```

Get the storage location addresses:

```shell
forge script StorageLocationScript
```

## Deployment

This contract is depends on [CREATE3Factory](https://github.com/ZeframLou/create3-factory)
make sure it get deployed on source and target chain with the same address.
