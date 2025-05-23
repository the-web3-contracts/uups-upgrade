## UUPS 升级案例

The Web3 社区 UUPS 升级案例课堂演示实战代码

## 安装依赖

```shell
forge install foundry-rs/forge-std --no-commit
forge install OpenZeppelin/openzeppelin-contracts --no-commit
forge install OpenZeppelin/openzeppelin-contracts-upgradeable --no-commit
forge install OpenZeppelin/openzeppelin-foundry-upgrades --no-commit
```

### 项目构建

```shell
$ forge build
```

### 启动 anvil 本地节点

```shell
$ anvil
```

### 部署升级测试

```shell
# 环境变量配置
export PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

# 部署第一版本的合约
forge script ./script/UUPSContractV1Script.sol:UUPSContractV1Script  --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

#### 升级前测试
```shell
cast send --rpc-url 127.0.0.1:8545 0xB7f8BC63BbcaD18155201308C8f3540b07f84F5e  "setValue(uint256)" 100 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
cast call --rpc-url 127.0.0.1:8545 0xB7f8BC63BbcaD18155201308C8f3540b07f84F5e  "value()(uint256)"
```

#### 部署第二版本合约

部署第二版合约时需要执行：`forge clean && forge build`

```shell
forge script ./script/UUPSContractV2Script.sol:UUPSContractV2Script  --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

#### 升级后测试
```shell
cast call --rpc-url 127.0.0.1:8545 0xB7f8BC63BbcaD18155201308C8f3540b07f84F5e  "value()(uint256)"
```
