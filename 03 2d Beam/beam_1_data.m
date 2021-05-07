% File: Beam_1_data.m
%
% The following variables are declared as global in order
% to be used by all the functions (M-files) constituting
% the program
%
global nnd nel nne nodof eldof n geom connec ...
prop nf Element_loads Joint_loads Hinge
%
format short e
%
%%%%%%%%%%%%%% Beginning of data input %%%%%%%%%%%%%%%%
%
nnd = 4; % Number of nodes:
nel = 3; % Number of elements:
nne = 2 ; % Number of nodes per element:
nodof =2 ; % Number of degrees of freedom per node
eldof = nne*nodof; % Number of degrees of freedom
% per element
%
% Nodes coordinates X and Y
geom=zeros(nnd,1);
geom= [ 0.; ... % X coord. node 1
4000.;... % X coord. node 2
9000.;... % X coord. node 3
16000. ] ; % X coord. node 4
%
% Element connectivity
%
connec=zeros(nel,2);
connec = [1 2 ; ... % 1st and 2nd node of element 1
2 3 ; ... % 1st and 2nd node of element 2
3 4 ]; % 1st and 2nd node of element 3
%
% Geometrical properties
%
% prop(1,1) = E; prop(1,2)= I
%
prop=zeros(nel,2);
prop = [200000 200.e+6; ... % E and I of element 1
200000 200.e+6; ... % E and I of element 2
200000 200.e+6]; % E and I of element 3
%
% Boundary conditions
%
nf = ones(nnd, nodof); % Initialize the matrix nf to 1
nf(1,1) = 0; nf(1,2) =0 ; % Prescribed nodal freedom of node 1
nf(2,1) = 0; % Prescribed nodal freedom of node 2
nf(3,1) = 0; % Prescribed nodal freedom of node 3
nf(4,1) = 0; nf(4,2)= 0 ; % Prescribed nodal freedom of node 4
%
% Counting of the free degrees of freedom
%
n=0;
for i=1:nnd
    for j=1:nodof
        if nf(i,j) ~= 0
        n=n+1;
        nf(i,j)=n;
        end
    end
end
%
%
% Internal Hinges
%
Hinge = ones(nel, 2);
%
% loading
%
Joint_loads= zeros(nnd, 2);
% Enter here the forces in X and Y directions at node i
%
Element_loads= zeros(nel, 4);
Element_loads(1,:)= [ -1.e4 -1.e7 -1.e4 1.e7];
Element_loads(2,:)= [ -1.e4 -8.333e6 -1.e4 8.333e6 ];
%
%%%%%%%%%%%%%%%%%%%%%%% End of input %%%%%%%%%%%%%%%%%%%%%%