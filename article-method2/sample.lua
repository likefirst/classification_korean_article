function tryRequire(pkg)
    require(pkg);
    print(string.format("Successfully loaded '%s'", pkg));
end

tryRequire('cunn')
tryRequire('optim')

torch.manualSeed(123);
x = torch.rand(128, 200) * 10;
y = torch.rand(128);
print('Successfully created Tensors');

torch.manualSeed(101);
model = nn.Sequential();
model:add(nn.Linear(200, 100));
model:add(nn.Sigmoid());
model:add(nn.Linear(100,1));
crit = nn.MSECriterion();
w,df_dw = model:getParameters();
print('Successfully created model');

function f(w)
    pred = model:forward(x);
    fw = crit:forward(pred,y);
    grad = crit:backward(pred, y);
    model:zeroGradParameters();
    model:backward(x,grad);
    return fw,df_dw;
end

print("Starting gradient descent from 'optim' on CPU...");
maxIter = 100;
timer = torch.Timer();
for i=1, maxIter do
    _,fw = optim.sgd(f,w);
    if i%(torch.floor(maxIter/10))==0 then print(string.format('MSE = %f', fw[1])) end
end
print(string.format('Success! Average iteration time was %f', timer:time().real/maxIter));
print('***************************************');

torch.manualSeed(101);
model:reset();

x = x:cuda();
y = y:cuda();
model:cuda();
crit:cuda();
w,df_dw = model:getParameters();
print('Successfully wrote Tensors to GPU');

print("Starting gradient descent from 'optim' on GPU...");
timer:reset();
for i=1,maxIter do
    _,fw = optim.sgd(f,w);
    if i%(torch.floor(maxIter/10))==0 then print(string.format('MSE = %f', fw[1])) end
end
cutorch.synchronize();
print(string.format('Success! Average iteration time was %f', timer:time().real/maxIter));
