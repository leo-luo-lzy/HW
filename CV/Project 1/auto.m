function tform = auto(I,I_prime)


I_g = rgb2gray(I);
I_prime_g = rgb2gray(I_prime);

mps = detectSURFFeatures(I_g, 'MetricThreshold', 1000);
mps_prime = detectSURFFeatures(I_prime_g, 'MetricThreshold', 1000);

[f vp] = extractFeatures(I_g, mps);
[f_prime vp_prime] = extractFeatures(I_prime_g, mps_prime);

idx = matchFeatures(f, f_prime);

mps = vp(idx(:,1), :);
mps_prime = vp_prime(idx(:,2), :);

figure;
showMatchedFeatures(I, I_prime, mps, mps_prime, 'montage');


[pro2d, ips, ips_prime] = estimateGeometricTransform(mps, mps_prime,...
    'projective', 'MaxDistance', 10.0);
figure;
showMatchedFeatures(I, I_prime, ips, ips_prime, 'montage');

A = double(pro2d.T);
tform = maketform('projective',double(A));