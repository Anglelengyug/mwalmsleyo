??
?2?2
:
Add
x"T
y"T
z"T"
Ttype:
2	
?
AdjustContrastv2

images
contrast_factor

output
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeint?
x
Assign
ref"T?

value"T

output_ref"T?"	
Ttype"
validate_shapebool("
use_lockingbool(?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

,
Cos
x"T
y"T"
Ttype:

2
y
Enter	
data"T
output"T"	
Ttype"

frame_namestring"
is_constantbool( "
parallel_iterationsint

)
Exit	
data"T
output"T"	
Ttype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
,
Floor
x"T
y"T"
Ttype:
2
9
FloorMod
x"T
y"T
z"T"
Ttype:

2	
?
FusedBatchNorm
x"T

scale"T
offset"T	
mean"T
variance"T
y"T

batch_mean"T
batch_variance"T
reserve_space_1"T
reserve_space_2"T"
Ttype:
2"
epsilonfloat%??8"
data_formatstringNHWC"
is_trainingbool(
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
?
ImageProjectiveTransform
images"dtype

transforms
transformed_images"dtype"
dtypetype:	
2	"
interpolationstring
?
ImageSummary
tag
tensor"T
summary"

max_imagesint(0"
Ttype0:
2"'
	bad_colortensorB:?  ?
:
Less
x"T
y"T
z
"
Ttype:
2	
!
LoopCond	
input


output

p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
?
MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
?
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
=
Mul
x"T
y"T
z"T"
Ttype:
2	?
.
Neg
x"T
y"T"
Ttype:

2	
2
NextIteration	
data"T
output"T"	
Ttype

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
?
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
?
RandomUniformInt

shape"T
minval"Tout
maxval"Tout
output"Tout"
seedint "
seed2int "
Touttype:
2	"
Ttype:
2	?
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
D
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
x
ResizeNearestNeighbor
images"T
size
resized_images"T"
Ttype:
2		"
align_cornersbool( 
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
	ReverseV2
tensor"T
axis"Tidx
output"T"
Tidxtype0:
2	"
Ttype:
2	

l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
,
Sin
x"T
y"T"
Ttype:

2
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
9
Softmax
logits"T
softmax"T"
Ttype:
2
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
{
TensorArrayGatherV3

handle
indices
flow_in
value"dtype"
dtypetype"
element_shapeshape:?
Y
TensorArrayReadV3

handle	
index
flow_in
value"dtype"
dtypetype?
d
TensorArrayScatterV3

handle
indices

value"T
flow_in
flow_out"	
Ttype?
9
TensorArraySizeV3

handle
flow_in
size?
?
TensorArrayV3
size

handle
flow"
dtypetype"
element_shapeshape:"
dynamic_sizebool( "
clear_after_readbool("$
identical_element_shapesbool( "
tensor_array_namestring ?
`
TensorArrayWriteV3

handle	
index

value"T
flow_in
flow_out"	
Ttype?
`
TensorSummaryV2
tag
tensor"T
serialized_summary_metadata
summary"	
Ttype
s

VariableV2
ref"dtype?"
shapeshape"
dtypetype"
	containerstring "
shared_namestring ?"serve*1.8.02v1.8.0-0-g93bc2e2072??

global_step/Initializer/zerosConst*
_class
loc:@global_step*
value	B	 R *
dtype0	*
_output_shapes
: 
?
global_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@global_step*
	container *
shape: 
?
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
_output_shapes
: *
T0	*
_class
loc:@global_step
Y
input_example_tensorPlaceholder*
dtype0*
_output_shapes
:*
shape:
U
ParseExample/ConstConst*
valueB *
dtype0*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
m
&ParseExample/ParseExample/dense_keys_0Const*
valueB Bmatrix*
dtype0*
_output_shapes
: 
?
ParseExample/ParseExampleParseExampleinput_example_tensorParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0ParseExample/Const*
Nsparse *
dense_shapes

:??*
sparse_types
 *
Tdense
2*
Ndense*)
_output_shapes
:???????????
f
Reshape/shapeConst*%
valueB"?????   ?      *
dtype0*
_output_shapes
:
?
ReshapeReshapeParseExample/ParseExampleReshape/shape*
T0*
Tshape0*1
_output_shapes
:???????????
c
!preprocess/Mean/reduction_indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
preprocess/MeanMeanReshape!preprocess/Mean/reduction_indices*
T0*1
_output_shapes
:???????????*
	keep_dims(*

Tidx0
q
preprocess/b_greyscale/tagConst*'
valueB Bpreprocess/b_greyscale*
dtype0*
_output_shapes
: 
?
preprocess/b_greyscaleImageSummarypreprocess/b_greyscale/tagpreprocess/Mean*

max_images*
T0*
	bad_colorB:?  ?*
_output_shapes
: 
c
preprocess/map/ShapeShapepreprocess/Mean*
_output_shapes
:*
T0*
out_type0
l
"preprocess/map/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
n
$preprocess/map/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$preprocess/map/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
preprocess/map/strided_sliceStridedSlicepreprocess/map/Shape"preprocess/map/strided_slice/stack$preprocess/map/strided_slice/stack_1$preprocess/map/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
preprocess/map/TensorArrayTensorArrayV3preprocess/map/strided_slice*
tensor_array_name *
dtype0*
_output_shapes

:: *
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
v
'preprocess/map/TensorArrayUnstack/ShapeShapepreprocess/Mean*
T0*
out_type0*
_output_shapes
:

5preprocess/map/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
7preprocess/map/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
7preprocess/map/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
/preprocess/map/TensorArrayUnstack/strided_sliceStridedSlice'preprocess/map/TensorArrayUnstack/Shape5preprocess/map/TensorArrayUnstack/strided_slice/stack7preprocess/map/TensorArrayUnstack/strided_slice/stack_17preprocess/map/TensorArrayUnstack/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
o
-preprocess/map/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
o
-preprocess/map/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
'preprocess/map/TensorArrayUnstack/rangeRange-preprocess/map/TensorArrayUnstack/range/start/preprocess/map/TensorArrayUnstack/strided_slice-preprocess/map/TensorArrayUnstack/range/delta*#
_output_shapes
:?????????*

Tidx0
?
Ipreprocess/map/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3preprocess/map/TensorArray'preprocess/map/TensorArrayUnstack/rangepreprocess/Meanpreprocess/map/TensorArray:1*
T0*"
_class
loc:@preprocess/Mean*
_output_shapes
: 
V
preprocess/map/ConstConst*
value	B : *
dtype0*
_output_shapes
: 
?
preprocess/map/TensorArray_1TensorArrayV3preprocess/map/strided_slice*
tensor_array_name *
dtype0*
_output_shapes

:: *
element_shape:*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
?
preprocess/map/while/EnterEnterpreprocess/map/Const*
T0*
is_constant( *
parallel_iterations
*
_output_shapes
: *2

frame_name$"preprocess/map/while/while_context
?
preprocess/map/while/Enter_1Enterpreprocess/map/TensorArray_1:1*
T0*
is_constant( *
parallel_iterations
*
_output_shapes
: *2

frame_name$"preprocess/map/while/while_context
?
preprocess/map/while/MergeMergepreprocess/map/while/Enter"preprocess/map/while/NextIteration*
T0*
N*
_output_shapes
: : 
?
preprocess/map/while/Merge_1Mergepreprocess/map/while/Enter_1$preprocess/map/while/NextIteration_1*
N*
_output_shapes
: : *
T0

preprocess/map/while/LessLesspreprocess/map/while/Mergepreprocess/map/while/Less/Enter*
T0*
_output_shapes
: 
?
preprocess/map/while/Less/EnterEnterpreprocess/map/strided_slice*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *2

frame_name$"preprocess/map/while/while_context
\
preprocess/map/while/LoopCondLoopCondpreprocess/map/while/Less*
_output_shapes
: 
?
preprocess/map/while/SwitchSwitchpreprocess/map/while/Mergepreprocess/map/while/LoopCond*
T0*-
_class#
!loc:@preprocess/map/while/Merge*
_output_shapes
: : 
?
preprocess/map/while/Switch_1Switchpreprocess/map/while/Merge_1preprocess/map/while/LoopCond*
_output_shapes
: : *
T0*/
_class%
#!loc:@preprocess/map/while/Merge_1
i
preprocess/map/while/IdentityIdentitypreprocess/map/while/Switch:1*
T0*
_output_shapes
: 
m
preprocess/map/while/Identity_1Identitypreprocess/map/while/Switch_1:1*
T0*
_output_shapes
: 
?
&preprocess/map/while/TensorArrayReadV3TensorArrayReadV3,preprocess/map/while/TensorArrayReadV3/Enterpreprocess/map/while/Identity.preprocess/map/while/TensorArrayReadV3/Enter_1*
dtype0*$
_output_shapes
:??
?
,preprocess/map/while/TensorArrayReadV3/EnterEnterpreprocess/map/TensorArray*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
:*2

frame_name$"preprocess/map/while/while_context
?
.preprocess/map/while/TensorArrayReadV3/Enter_1EnterIpreprocess/map/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *2

frame_name$"preprocess/map/while/while_context
?
>preprocess/map/while/random_flip_left_right/control_dependencyIdentity&preprocess/map/while/TensorArrayReadV3*
T0*9
_class/
-+loc:@preprocess/map/while/TensorArrayReadV3*$
_output_shapes
:??
?
@preprocess/map/while/random_flip_left_right/random_uniform/shapeConst^preprocess/map/while/Identity*
dtype0*
_output_shapes
: *
valueB 
?
>preprocess/map/while/random_flip_left_right/random_uniform/minConst^preprocess/map/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *    
?
>preprocess/map/while/random_flip_left_right/random_uniform/maxConst^preprocess/map/while/Identity*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Hpreprocess/map/while/random_flip_left_right/random_uniform/RandomUniformRandomUniform@preprocess/map/while/random_flip_left_right/random_uniform/shape*
dtype0*
_output_shapes
: *
seed2 *

seed *
T0
?
>preprocess/map/while/random_flip_left_right/random_uniform/subSub>preprocess/map/while/random_flip_left_right/random_uniform/max>preprocess/map/while/random_flip_left_right/random_uniform/min*
T0*
_output_shapes
: 
?
>preprocess/map/while/random_flip_left_right/random_uniform/mulMulHpreprocess/map/while/random_flip_left_right/random_uniform/RandomUniform>preprocess/map/while/random_flip_left_right/random_uniform/sub*
T0*
_output_shapes
: 
?
:preprocess/map/while/random_flip_left_right/random_uniformAdd>preprocess/map/while/random_flip_left_right/random_uniform/mul>preprocess/map/while/random_flip_left_right/random_uniform/min*
T0*
_output_shapes
: 
?
2preprocess/map/while/random_flip_left_right/Less/yConst^preprocess/map/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *   ?
?
0preprocess/map/while/random_flip_left_right/LessLess:preprocess/map/while/random_flip_left_right/random_uniform2preprocess/map/while/random_flip_left_right/Less/y*
T0*
_output_shapes
: 
?
2preprocess/map/while/random_flip_left_right/SwitchSwitch0preprocess/map/while/random_flip_left_right/Less0preprocess/map/while/random_flip_left_right/Less*
T0
*
_output_shapes
: : 
?
4preprocess/map/while/random_flip_left_right/switch_tIdentity4preprocess/map/while/random_flip_left_right/Switch:1*
T0
*
_output_shapes
: 
?
4preprocess/map/while/random_flip_left_right/switch_fIdentity2preprocess/map/while/random_flip_left_right/Switch*
_output_shapes
: *
T0

?
3preprocess/map/while/random_flip_left_right/pred_idIdentity0preprocess/map/while/random_flip_left_right/Less*
T0
*
_output_shapes
: 
?
:preprocess/map/while/random_flip_left_right/ReverseV2/axisConst5^preprocess/map/while/random_flip_left_right/switch_t*
dtype0*
_output_shapes
:*
valueB:
?
5preprocess/map/while/random_flip_left_right/ReverseV2	ReverseV2>preprocess/map/while/random_flip_left_right/ReverseV2/Switch:1:preprocess/map/while/random_flip_left_right/ReverseV2/axis*
T0*$
_output_shapes
:??*

Tidx0
?
<preprocess/map/while/random_flip_left_right/ReverseV2/SwitchSwitch>preprocess/map/while/random_flip_left_right/control_dependency3preprocess/map/while/random_flip_left_right/pred_id*
T0*9
_class/
-+loc:@preprocess/map/while/TensorArrayReadV3*4
_output_shapes"
 :??:??
?
4preprocess/map/while/random_flip_left_right/Switch_1Switch>preprocess/map/while/random_flip_left_right/control_dependency3preprocess/map/while/random_flip_left_right/pred_id*4
_output_shapes"
 :??:??*
T0*9
_class/
-+loc:@preprocess/map/while/TensorArrayReadV3
?
1preprocess/map/while/random_flip_left_right/MergeMerge4preprocess/map/while/random_flip_left_right/Switch_15preprocess/map/while/random_flip_left_right/ReverseV2*
T0*
N*&
_output_shapes
:??: 
?
8preprocess/map/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3>preprocess/map/while/TensorArrayWrite/TensorArrayWriteV3/Enterpreprocess/map/while/Identity1preprocess/map/while/random_flip_left_right/Mergepreprocess/map/while/Identity_1*
T0*D
_class:
86loc:@preprocess/map/while/random_flip_left_right/Merge*
_output_shapes
: 
?
>preprocess/map/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterpreprocess/map/TensorArray_1*
_output_shapes
:*2

frame_name$"preprocess/map/while/while_context*
T0*D
_class:
86loc:@preprocess/map/while/random_flip_left_right/Merge*
parallel_iterations
*
is_constant(
|
preprocess/map/while/add/yConst^preprocess/map/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
{
preprocess/map/while/addAddpreprocess/map/while/Identitypreprocess/map/while/add/y*
T0*
_output_shapes
: 
n
"preprocess/map/while/NextIterationNextIterationpreprocess/map/while/add*
T0*
_output_shapes
: 
?
$preprocess/map/while/NextIteration_1NextIteration8preprocess/map/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
_
preprocess/map/while/ExitExitpreprocess/map/while/Switch*
T0*
_output_shapes
: 
c
preprocess/map/while/Exit_1Exitpreprocess/map/while/Switch_1*
T0*
_output_shapes
: 
?
1preprocess/map/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3preprocess/map/TensorArray_1preprocess/map/while/Exit_1*/
_class%
#!loc:@preprocess/map/TensorArray_1*
_output_shapes
: 
?
+preprocess/map/TensorArrayStack/range/startConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@preprocess/map/TensorArray_1*
value	B : 
?
+preprocess/map/TensorArrayStack/range/deltaConst*/
_class%
#!loc:@preprocess/map/TensorArray_1*
value	B :*
dtype0*
_output_shapes
: 
?
%preprocess/map/TensorArrayStack/rangeRange+preprocess/map/TensorArrayStack/range/start1preprocess/map/TensorArrayStack/TensorArraySizeV3+preprocess/map/TensorArrayStack/range/delta*

Tidx0*/
_class%
#!loc:@preprocess/map/TensorArray_1*#
_output_shapes
:?????????
?
3preprocess/map/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3preprocess/map/TensorArray_1%preprocess/map/TensorArrayStack/rangepreprocess/map/while/Exit_1*!
element_shape:??*/
_class%
#!loc:@preprocess/map/TensorArray_1*
dtype0*1
_output_shapes
:???????????
?
preprocess/map_1/ShapeShape3preprocess/map/TensorArrayStack/TensorArrayGatherV3*
T0*
out_type0*
_output_shapes
:
n
$preprocess/map_1/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
p
&preprocess/map_1/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
p
&preprocess/map_1/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
preprocess/map_1/strided_sliceStridedSlicepreprocess/map_1/Shape$preprocess/map_1/strided_slice/stack&preprocess/map_1/strided_slice/stack_1&preprocess/map_1/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
?
preprocess/map_1/TensorArrayTensorArrayV3preprocess/map_1/strided_slice*
tensor_array_name *
dtype0*
_output_shapes

:: *
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
?
)preprocess/map_1/TensorArrayUnstack/ShapeShape3preprocess/map/TensorArrayStack/TensorArrayGatherV3*
T0*
out_type0*
_output_shapes
:
?
7preprocess/map_1/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
9preprocess/map_1/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
9preprocess/map_1/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
1preprocess/map_1/TensorArrayUnstack/strided_sliceStridedSlice)preprocess/map_1/TensorArrayUnstack/Shape7preprocess/map_1/TensorArrayUnstack/strided_slice/stack9preprocess/map_1/TensorArrayUnstack/strided_slice/stack_19preprocess/map_1/TensorArrayUnstack/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
q
/preprocess/map_1/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
q
/preprocess/map_1/TensorArrayUnstack/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
)preprocess/map_1/TensorArrayUnstack/rangeRange/preprocess/map_1/TensorArrayUnstack/range/start1preprocess/map_1/TensorArrayUnstack/strided_slice/preprocess/map_1/TensorArrayUnstack/range/delta*#
_output_shapes
:?????????*

Tidx0
?
Kpreprocess/map_1/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3preprocess/map_1/TensorArray)preprocess/map_1/TensorArrayUnstack/range3preprocess/map/TensorArrayStack/TensorArrayGatherV3preprocess/map_1/TensorArray:1*
T0*/
_class%
#!loc:@preprocess/map/TensorArray_1*
_output_shapes
: 
X
preprocess/map_1/ConstConst*
dtype0*
_output_shapes
: *
value	B : 
?
preprocess/map_1/TensorArray_1TensorArrayV3preprocess/map_1/strided_slice*
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*
tensor_array_name *
dtype0*
_output_shapes

:: 
?
preprocess/map_1/while/EnterEnterpreprocess/map_1/Const*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_1/while/while_context*
T0*
is_constant( 
?
preprocess/map_1/while/Enter_1Enter preprocess/map_1/TensorArray_1:1*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_1/while/while_context*
T0*
is_constant( 
?
preprocess/map_1/while/MergeMergepreprocess/map_1/while/Enter$preprocess/map_1/while/NextIteration*
N*
_output_shapes
: : *
T0
?
preprocess/map_1/while/Merge_1Mergepreprocess/map_1/while/Enter_1&preprocess/map_1/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
?
preprocess/map_1/while/LessLesspreprocess/map_1/while/Merge!preprocess/map_1/while/Less/Enter*
T0*
_output_shapes
: 
?
!preprocess/map_1/while/Less/EnterEnterpreprocess/map_1/strided_slice*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_1/while/while_context
`
preprocess/map_1/while/LoopCondLoopCondpreprocess/map_1/while/Less*
_output_shapes
: 
?
preprocess/map_1/while/SwitchSwitchpreprocess/map_1/while/Mergepreprocess/map_1/while/LoopCond*
T0*/
_class%
#!loc:@preprocess/map_1/while/Merge*
_output_shapes
: : 
?
preprocess/map_1/while/Switch_1Switchpreprocess/map_1/while/Merge_1preprocess/map_1/while/LoopCond*
_output_shapes
: : *
T0*1
_class'
%#loc:@preprocess/map_1/while/Merge_1
m
preprocess/map_1/while/IdentityIdentitypreprocess/map_1/while/Switch:1*
T0*
_output_shapes
: 
q
!preprocess/map_1/while/Identity_1Identity!preprocess/map_1/while/Switch_1:1*
T0*
_output_shapes
: 
?
(preprocess/map_1/while/TensorArrayReadV3TensorArrayReadV3.preprocess/map_1/while/TensorArrayReadV3/Enterpreprocess/map_1/while/Identity0preprocess/map_1/while/TensorArrayReadV3/Enter_1*
dtype0*$
_output_shapes
:??
?
.preprocess/map_1/while/TensorArrayReadV3/EnterEnterpreprocess/map_1/TensorArray*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
:*4

frame_name&$preprocess/map_1/while/while_context
?
0preprocess/map_1/while/TensorArrayReadV3/Enter_1EnterKpreprocess/map_1/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_1/while/while_context
?
=preprocess/map_1/while/random_flip_up_down/control_dependencyIdentity(preprocess/map_1/while/TensorArrayReadV3*
T0*;
_class1
/-loc:@preprocess/map_1/while/TensorArrayReadV3*$
_output_shapes
:??
?
?preprocess/map_1/while/random_flip_up_down/random_uniform/shapeConst ^preprocess/map_1/while/Identity*
valueB *
dtype0*
_output_shapes
: 
?
=preprocess/map_1/while/random_flip_up_down/random_uniform/minConst ^preprocess/map_1/while/Identity*
valueB
 *    *
dtype0*
_output_shapes
: 
?
=preprocess/map_1/while/random_flip_up_down/random_uniform/maxConst ^preprocess/map_1/while/Identity*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Gpreprocess/map_1/while/random_flip_up_down/random_uniform/RandomUniformRandomUniform?preprocess/map_1/while/random_flip_up_down/random_uniform/shape*
dtype0*
_output_shapes
: *
seed2 *

seed *
T0
?
=preprocess/map_1/while/random_flip_up_down/random_uniform/subSub=preprocess/map_1/while/random_flip_up_down/random_uniform/max=preprocess/map_1/while/random_flip_up_down/random_uniform/min*
T0*
_output_shapes
: 
?
=preprocess/map_1/while/random_flip_up_down/random_uniform/mulMulGpreprocess/map_1/while/random_flip_up_down/random_uniform/RandomUniform=preprocess/map_1/while/random_flip_up_down/random_uniform/sub*
T0*
_output_shapes
: 
?
9preprocess/map_1/while/random_flip_up_down/random_uniformAdd=preprocess/map_1/while/random_flip_up_down/random_uniform/mul=preprocess/map_1/while/random_flip_up_down/random_uniform/min*
T0*
_output_shapes
: 
?
1preprocess/map_1/while/random_flip_up_down/Less/yConst ^preprocess/map_1/while/Identity*
valueB
 *   ?*
dtype0*
_output_shapes
: 
?
/preprocess/map_1/while/random_flip_up_down/LessLess9preprocess/map_1/while/random_flip_up_down/random_uniform1preprocess/map_1/while/random_flip_up_down/Less/y*
T0*
_output_shapes
: 
?
1preprocess/map_1/while/random_flip_up_down/SwitchSwitch/preprocess/map_1/while/random_flip_up_down/Less/preprocess/map_1/while/random_flip_up_down/Less*
T0
*
_output_shapes
: : 
?
3preprocess/map_1/while/random_flip_up_down/switch_tIdentity3preprocess/map_1/while/random_flip_up_down/Switch:1*
T0
*
_output_shapes
: 
?
3preprocess/map_1/while/random_flip_up_down/switch_fIdentity1preprocess/map_1/while/random_flip_up_down/Switch*
T0
*
_output_shapes
: 
?
2preprocess/map_1/while/random_flip_up_down/pred_idIdentity/preprocess/map_1/while/random_flip_up_down/Less*
T0
*
_output_shapes
: 
?
9preprocess/map_1/while/random_flip_up_down/ReverseV2/axisConst4^preprocess/map_1/while/random_flip_up_down/switch_t*
valueB: *
dtype0*
_output_shapes
:
?
4preprocess/map_1/while/random_flip_up_down/ReverseV2	ReverseV2=preprocess/map_1/while/random_flip_up_down/ReverseV2/Switch:19preprocess/map_1/while/random_flip_up_down/ReverseV2/axis*
T0*$
_output_shapes
:??*

Tidx0
?
;preprocess/map_1/while/random_flip_up_down/ReverseV2/SwitchSwitch=preprocess/map_1/while/random_flip_up_down/control_dependency2preprocess/map_1/while/random_flip_up_down/pred_id*
T0*;
_class1
/-loc:@preprocess/map_1/while/TensorArrayReadV3*4
_output_shapes"
 :??:??
?
3preprocess/map_1/while/random_flip_up_down/Switch_1Switch=preprocess/map_1/while/random_flip_up_down/control_dependency2preprocess/map_1/while/random_flip_up_down/pred_id*4
_output_shapes"
 :??:??*
T0*;
_class1
/-loc:@preprocess/map_1/while/TensorArrayReadV3
?
0preprocess/map_1/while/random_flip_up_down/MergeMerge3preprocess/map_1/while/random_flip_up_down/Switch_14preprocess/map_1/while/random_flip_up_down/ReverseV2*
T0*
N*&
_output_shapes
:??: 
?
:preprocess/map_1/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3@preprocess/map_1/while/TensorArrayWrite/TensorArrayWriteV3/Enterpreprocess/map_1/while/Identity0preprocess/map_1/while/random_flip_up_down/Merge!preprocess/map_1/while/Identity_1*
T0*C
_class9
75loc:@preprocess/map_1/while/random_flip_up_down/Merge*
_output_shapes
: 
?
@preprocess/map_1/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterpreprocess/map_1/TensorArray_1*
parallel_iterations
*
is_constant(*
_output_shapes
:*4

frame_name&$preprocess/map_1/while/while_context*
T0*C
_class9
75loc:@preprocess/map_1/while/random_flip_up_down/Merge
?
preprocess/map_1/while/add/yConst ^preprocess/map_1/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
?
preprocess/map_1/while/addAddpreprocess/map_1/while/Identitypreprocess/map_1/while/add/y*
T0*
_output_shapes
: 
r
$preprocess/map_1/while/NextIterationNextIterationpreprocess/map_1/while/add*
T0*
_output_shapes
: 
?
&preprocess/map_1/while/NextIteration_1NextIteration:preprocess/map_1/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
c
preprocess/map_1/while/ExitExitpreprocess/map_1/while/Switch*
T0*
_output_shapes
: 
g
preprocess/map_1/while/Exit_1Exitpreprocess/map_1/while/Switch_1*
T0*
_output_shapes
: 
?
3preprocess/map_1/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3preprocess/map_1/TensorArray_1preprocess/map_1/while/Exit_1*1
_class'
%#loc:@preprocess/map_1/TensorArray_1*
_output_shapes
: 
?
-preprocess/map_1/TensorArrayStack/range/startConst*
dtype0*
_output_shapes
: *1
_class'
%#loc:@preprocess/map_1/TensorArray_1*
value	B : 
?
-preprocess/map_1/TensorArrayStack/range/deltaConst*1
_class'
%#loc:@preprocess/map_1/TensorArray_1*
value	B :*
dtype0*
_output_shapes
: 
?
'preprocess/map_1/TensorArrayStack/rangeRange-preprocess/map_1/TensorArrayStack/range/start3preprocess/map_1/TensorArrayStack/TensorArraySizeV3-preprocess/map_1/TensorArrayStack/range/delta*1
_class'
%#loc:@preprocess/map_1/TensorArray_1*#
_output_shapes
:?????????*

Tidx0
?
5preprocess/map_1/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3preprocess/map_1/TensorArray_1'preprocess/map_1/TensorArrayStack/rangepreprocess/map_1/while/Exit_1*!
element_shape:??*1
_class'
%#loc:@preprocess/map_1/TensorArray_1*
dtype0*1
_output_shapes
:???????????
?
preprocess/map_2/ShapeShape5preprocess/map_1/TensorArrayStack/TensorArrayGatherV3*
T0*
out_type0*
_output_shapes
:
n
$preprocess/map_2/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
p
&preprocess/map_2/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
p
&preprocess/map_2/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
preprocess/map_2/strided_sliceStridedSlicepreprocess/map_2/Shape$preprocess/map_2/strided_slice/stack&preprocess/map_2/strided_slice/stack_1&preprocess/map_2/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
preprocess/map_2/TensorArrayTensorArrayV3preprocess/map_2/strided_slice*
tensor_array_name *
dtype0*
_output_shapes

:: *
element_shape:*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
?
)preprocess/map_2/TensorArrayUnstack/ShapeShape5preprocess/map_1/TensorArrayStack/TensorArrayGatherV3*
_output_shapes
:*
T0*
out_type0
?
7preprocess/map_2/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
9preprocess/map_2/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
9preprocess/map_2/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
1preprocess/map_2/TensorArrayUnstack/strided_sliceStridedSlice)preprocess/map_2/TensorArrayUnstack/Shape7preprocess/map_2/TensorArrayUnstack/strided_slice/stack9preprocess/map_2/TensorArrayUnstack/strided_slice/stack_19preprocess/map_2/TensorArrayUnstack/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
q
/preprocess/map_2/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
q
/preprocess/map_2/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
)preprocess/map_2/TensorArrayUnstack/rangeRange/preprocess/map_2/TensorArrayUnstack/range/start1preprocess/map_2/TensorArrayUnstack/strided_slice/preprocess/map_2/TensorArrayUnstack/range/delta*#
_output_shapes
:?????????*

Tidx0
?
Kpreprocess/map_2/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3preprocess/map_2/TensorArray)preprocess/map_2/TensorArrayUnstack/range5preprocess/map_1/TensorArrayStack/TensorArrayGatherV3preprocess/map_2/TensorArray:1*
T0*1
_class'
%#loc:@preprocess/map_1/TensorArray_1*
_output_shapes
: 
X
preprocess/map_2/ConstConst*
value	B : *
dtype0*
_output_shapes
: 
?
preprocess/map_2/TensorArray_1TensorArrayV3preprocess/map_2/strided_slice*
identical_element_shapes(*
tensor_array_name *
dtype0*
_output_shapes

:: *
element_shape:*
clear_after_read(*
dynamic_size( 
?
preprocess/map_2/while/EnterEnterpreprocess/map_2/Const*
T0*
is_constant( *
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_2/while/while_context
?
preprocess/map_2/while/Enter_1Enter preprocess/map_2/TensorArray_1:1*
T0*
is_constant( *
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_2/while/while_context
?
preprocess/map_2/while/MergeMergepreprocess/map_2/while/Enter$preprocess/map_2/while/NextIteration*
T0*
N*
_output_shapes
: : 
?
preprocess/map_2/while/Merge_1Mergepreprocess/map_2/while/Enter_1&preprocess/map_2/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
?
preprocess/map_2/while/LessLesspreprocess/map_2/while/Merge!preprocess/map_2/while/Less/Enter*
T0*
_output_shapes
: 
?
!preprocess/map_2/while/Less/EnterEnterpreprocess/map_2/strided_slice*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_2/while/while_context
`
preprocess/map_2/while/LoopCondLoopCondpreprocess/map_2/while/Less*
_output_shapes
: 
?
preprocess/map_2/while/SwitchSwitchpreprocess/map_2/while/Mergepreprocess/map_2/while/LoopCond*
T0*/
_class%
#!loc:@preprocess/map_2/while/Merge*
_output_shapes
: : 
?
preprocess/map_2/while/Switch_1Switchpreprocess/map_2/while/Merge_1preprocess/map_2/while/LoopCond*
T0*1
_class'
%#loc:@preprocess/map_2/while/Merge_1*
_output_shapes
: : 
m
preprocess/map_2/while/IdentityIdentitypreprocess/map_2/while/Switch:1*
T0*
_output_shapes
: 
q
!preprocess/map_2/while/Identity_1Identity!preprocess/map_2/while/Switch_1:1*
T0*
_output_shapes
: 
?
(preprocess/map_2/while/TensorArrayReadV3TensorArrayReadV3.preprocess/map_2/while/TensorArrayReadV3/Enterpreprocess/map_2/while/Identity0preprocess/map_2/while/TensorArrayReadV3/Enter_1*
dtype0*$
_output_shapes
:??
?
.preprocess/map_2/while/TensorArrayReadV3/EnterEnterpreprocess/map_2/TensorArray*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
:*4

frame_name&$preprocess/map_2/while/while_context
?
0preprocess/map_2/while/TensorArrayReadV3/Enter_1EnterKpreprocess/map_2/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_2/while/while_context
?
+preprocess/map_2/while/random_uniform/shapeConst ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
)preprocess/map_2/while/random_uniform/minConst ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *    
?
)preprocess/map_2/while/random_uniform/maxConst ^preprocess/map_2/while/Identity*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
3preprocess/map_2/while/random_uniform/RandomUniformRandomUniform+preprocess/map_2/while/random_uniform/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
?
)preprocess/map_2/while/random_uniform/subSub)preprocess/map_2/while/random_uniform/max)preprocess/map_2/while/random_uniform/min*
_output_shapes
: *
T0
?
)preprocess/map_2/while/random_uniform/mulMul3preprocess/map_2/while/random_uniform/RandomUniform)preprocess/map_2/while/random_uniform/sub*
T0*
_output_shapes
:
?
%preprocess/map_2/while/random_uniformAdd)preprocess/map_2/while/random_uniform/mul)preprocess/map_2/while/random_uniform/min*
T0*
_output_shapes
:
?
preprocess/map_2/while/mul/xConst ^preprocess/map_2/while/Identity*
valueB
 *??H@*
dtype0*
_output_shapes
: 
?
preprocess/map_2/while/mulMulpreprocess/map_2/while/mul/x%preprocess/map_2/while/random_uniform*
_output_shapes
:*
T0
?
1preprocess/map_2/while/rotate/strided_slice/stackConst ^preprocess/map_2/while/Identity*%
valueB"                *
dtype0*
_output_shapes
:
?
3preprocess/map_2/while/rotate/strided_slice/stack_1Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*%
valueB"                
?
3preprocess/map_2/while/rotate/strided_slice/stack_2Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*%
valueB"            
?
+preprocess/map_2/while/rotate/strided_sliceStridedSlice(preprocess/map_2/while/TensorArrayReadV31preprocess/map_2/while/rotate/strided_slice/stack3preprocess/map_2/while/rotate/strided_slice/stack_13preprocess/map_2/while/rotate/strided_slice/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask*
end_mask*(
_output_shapes
:??*
T0*
Index0
?
#preprocess/map_2/while/rotate/ShapeConst ^preprocess/map_2/while/Identity*%
valueB"   ?   ?      *
dtype0*
_output_shapes
:
?
3preprocess/map_2/while/rotate/strided_slice_1/stackConst ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
5preprocess/map_2/while/rotate/strided_slice_1/stack_1Const ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
5preprocess/map_2/while/rotate/strided_slice_1/stack_2Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB:
?
-preprocess/map_2/while/rotate/strided_slice_1StridedSlice#preprocess/map_2/while/rotate/Shape3preprocess/map_2/while/rotate/strided_slice_1/stack5preprocess/map_2/while/rotate/strided_slice_1/stack_15preprocess/map_2/while/rotate/strided_slice_1/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
"preprocess/map_2/while/rotate/CastCast-preprocess/map_2/while/rotate/strided_slice_1*

SrcT0*
_output_shapes
: *

DstT0
?
3preprocess/map_2/while/rotate/strided_slice_2/stackConst ^preprocess/map_2/while/Identity*
valueB: *
dtype0*
_output_shapes
:
?
5preprocess/map_2/while/rotate/strided_slice_2/stack_1Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB: 
?
5preprocess/map_2/while/rotate/strided_slice_2/stack_2Const ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
-preprocess/map_2/while/rotate/strided_slice_2StridedSlice"preprocess/map_2/while/rotate/Cast3preprocess/map_2/while/rotate/strided_slice_2/stack5preprocess/map_2/while/rotate/strided_slice_2/stack_15preprocess/map_2/while/rotate/strided_slice_2/stack_2*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask*
end_mask *
_output_shapes
:*
T0*
Index0
?
%preprocess/map_2/while/rotate/Shape_1Const ^preprocess/map_2/while/Identity*%
valueB"   ?   ?      *
dtype0*
_output_shapes
:
?
3preprocess/map_2/while/rotate/strided_slice_3/stackConst ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
5preprocess/map_2/while/rotate/strided_slice_3/stack_1Const ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
5preprocess/map_2/while/rotate/strided_slice_3/stack_2Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB:
?
-preprocess/map_2/while/rotate/strided_slice_3StridedSlice%preprocess/map_2/while/rotate/Shape_13preprocess/map_2/while/rotate/strided_slice_3/stack5preprocess/map_2/while/rotate/strided_slice_3/stack_15preprocess/map_2/while/rotate/strided_slice_3/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
$preprocess/map_2/while/rotate/Cast_1Cast-preprocess/map_2/while/rotate/strided_slice_3*
_output_shapes
: *

DstT0*

SrcT0
?
3preprocess/map_2/while/rotate/strided_slice_4/stackConst ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB: 
?
5preprocess/map_2/while/rotate/strided_slice_4/stack_1Const ^preprocess/map_2/while/Identity*
valueB: *
dtype0*
_output_shapes
:
?
5preprocess/map_2/while/rotate/strided_slice_4/stack_2Const ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
-preprocess/map_2/while/rotate/strided_slice_4StridedSlice$preprocess/map_2/while/rotate/Cast_13preprocess/map_2/while/rotate/strided_slice_4/stack5preprocess/map_2/while/rotate/strided_slice_4/stack_15preprocess/map_2/while/rotate/strided_slice_4/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask*
end_mask *
_output_shapes
:
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub/yConst ^preprocess/map_2/while/Identity*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Apreprocess/map_2/while/rotate/angles_to_projective_transforms/subSub-preprocess/map_2/while/rotate/strided_slice_4Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub/y*
T0*
_output_shapes
:
?
Apreprocess/map_2/while/rotate/angles_to_projective_transforms/CosCospreprocess/map_2/while/mul*
_output_shapes
:*
T0
?
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_1/yConst ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *  ??
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_1Sub-preprocess/map_2/while/rotate/strided_slice_4Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_1/y*
T0*
_output_shapes
:
?
Apreprocess/map_2/while/rotate/angles_to_projective_transforms/mulMulApreprocess/map_2/while/rotate/angles_to_projective_transforms/CosCpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_1*
T0*
_output_shapes
:
?
Apreprocess/map_2/while/rotate/angles_to_projective_transforms/SinSinpreprocess/map_2/while/mul*
T0*
_output_shapes
:
?
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_2/yConst ^preprocess/map_2/while/Identity*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_2Sub-preprocess/map_2/while/rotate/strided_slice_2Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_2/y*
T0*
_output_shapes
:
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_1MulApreprocess/map_2/while/rotate/angles_to_projective_transforms/SinCpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_2*
T0*
_output_shapes
:
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_3SubApreprocess/map_2/while/rotate/angles_to_projective_transforms/mulCpreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_1*
T0*
_output_shapes
:
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_4SubApreprocess/map_2/while/rotate/angles_to_projective_transforms/subCpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_3*
_output_shapes
:*
T0
?
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv/yConst ^preprocess/map_2/while/Identity*
valueB
 *   @*
dtype0*
_output_shapes
: 
?
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/truedivRealDivCpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_4Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv/y*
T0*
_output_shapes
:
?
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_5/yConst ^preprocess/map_2/while/Identity*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_5Sub-preprocess/map_2/while/rotate/strided_slice_2Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_5/y*
T0*
_output_shapes
:
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_1Sinpreprocess/map_2/while/mul*
T0*
_output_shapes
:
?
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_6/yConst ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *  ??
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_6Sub-preprocess/map_2/while/rotate/strided_slice_4Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_6/y*
T0*
_output_shapes
:
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_2MulCpreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_1Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_6*
_output_shapes
:*
T0
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_1Cospreprocess/map_2/while/mul*
T0*
_output_shapes
:
?
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_7/yConst ^preprocess/map_2/while/Identity*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_7Sub-preprocess/map_2/while/rotate/strided_slice_2Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_7/y*
_output_shapes
:*
T0
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_3MulCpreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_1Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_7*
T0*
_output_shapes
:
?
Apreprocess/map_2/while/rotate/angles_to_projective_transforms/addAddCpreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_2Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_3*
_output_shapes
:*
T0
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_8SubCpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_5Apreprocess/map_2/while/rotate/angles_to_projective_transforms/add*
T0*
_output_shapes
:
?
Ipreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv_1/yConst ^preprocess/map_2/while/Identity*
valueB
 *   @*
dtype0*
_output_shapes
: 
?
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv_1RealDivCpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_8Ipreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv_1/y*
T0*
_output_shapes
:
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/ShapeConst ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
Qpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stackConst ^preprocess/map_2/while/Identity*
valueB: *
dtype0*
_output_shapes
:
?
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stack_1Const ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stack_2Const ^preprocess/map_2/while/Identity*
valueB:*
dtype0*
_output_shapes
:
?
Kpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_sliceStridedSliceCpreprocess/map_2/while/rotate/angles_to_projective_transforms/ShapeQpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stackSpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stack_1Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stack_2*
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_2Cospreprocess/map_2/while/mul*
T0*
_output_shapes
:
?
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stackConst ^preprocess/map_2/while/Identity*
valueB"        *
dtype0*
_output_shapes
:
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stack_1Const ^preprocess/map_2/while/Identity*
valueB"        *
dtype0*
_output_shapes
:
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stack_2Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB"      
?
Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1StridedSliceCpreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_2Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stackUpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stack_1Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask*
end_mask*
_output_shapes

:*
T0*
Index0
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_2Sinpreprocess/map_2/while/mul*
T0*
_output_shapes
:
?
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stackConst ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB"        
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stack_1Const ^preprocess/map_2/while/Identity*
valueB"        *
dtype0*
_output_shapes
:
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stack_2Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB"      
?
Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2StridedSliceCpreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_2Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stackUpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stack_1Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask*
end_mask*
_output_shapes

:*
T0*
Index0*
shrink_axis_mask 
?
Apreprocess/map_2/while/rotate/angles_to_projective_transforms/NegNegMpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2*
_output_shapes

:*
T0
?
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stackConst ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB"        
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stack_1Const ^preprocess/map_2/while/Identity*
valueB"        *
dtype0*
_output_shapes
:
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stack_2Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB"      
?
Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3StridedSliceEpreprocess/map_2/while/rotate/angles_to_projective_transforms/truedivSpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stackUpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stack_1Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask*
end_mask*
_output_shapes

:*
Index0*
T0*
shrink_axis_mask 
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_3Sinpreprocess/map_2/while/mul*
_output_shapes
:*
T0
?
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stackConst ^preprocess/map_2/while/Identity*
valueB"        *
dtype0*
_output_shapes
:
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stack_1Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB"        
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stack_2Const ^preprocess/map_2/while/Identity*
valueB"      *
dtype0*
_output_shapes
:
?
Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4StridedSliceCpreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_3Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stackUpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stack_1Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask*
end_mask*
_output_shapes

:*
Index0*
T0*
shrink_axis_mask 
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_3Cospreprocess/map_2/while/mul*
T0*
_output_shapes
:
?
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stackConst ^preprocess/map_2/while/Identity*
valueB"        *
dtype0*
_output_shapes
:
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stack_1Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB"        
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stack_2Const ^preprocess/map_2/while/Identity*
valueB"      *
dtype0*
_output_shapes
:
?
Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5StridedSliceCpreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_3Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stackUpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stack_1Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask*
end_mask*
_output_shapes

:*
Index0*
T0
?
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stackConst ^preprocess/map_2/while/Identity*
valueB"        *
dtype0*
_output_shapes
:
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stack_1Const ^preprocess/map_2/while/Identity*
valueB"        *
dtype0*
_output_shapes
:
?
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stack_2Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*
valueB"      
?
Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6StridedSliceGpreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv_1Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stackUpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stack_1Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stack_2*
Index0*
T0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask*
end_mask*
_output_shapes

:
?
Ipreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/mul/yConst ^preprocess/map_2/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
?
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/mulMulKpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_sliceIpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/mul/y*
_output_shapes
: *
T0
?
Jpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/Less/yConst ^preprocess/map_2/while/Identity*
value
B :?*
dtype0*
_output_shapes
: 
?
Hpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/LessLessGpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/mulJpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/Less/y*
T0*
_output_shapes
: 
?
Lpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/packed/1Const ^preprocess/map_2/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
?
Jpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/packedPackKpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_sliceLpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/packed/1*
T0*

axis *
N*
_output_shapes
:
?
Ipreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/ConstConst ^preprocess/map_2/while/Identity*
valueB
 *    *
dtype0*
_output_shapes
: 
?
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/zerosFillJpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/packedIpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/Const*'
_output_shapes
:?????????*
T0*

index_type0
?
Ipreprocess/map_2/while/rotate/angles_to_projective_transforms/concat/axisConst ^preprocess/map_2/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
?
Dpreprocess/map_2/while/rotate/angles_to_projective_transforms/concatConcatV2Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1Apreprocess/map_2/while/rotate/angles_to_projective_transforms/NegMpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/zerosIpreprocess/map_2/while/rotate/angles_to_projective_transforms/concat/axis*
T0*
N*
_output_shapes

:*

Tidx0
?
@preprocess/map_2/while/rotate/transform/ImageProjectiveTransformImageProjectiveTransform+preprocess/map_2/while/rotate/strided_sliceDpreprocess/map_2/while/rotate/angles_to_projective_transforms/concat*
interpolation
BILINEAR*
dtype0*(
_output_shapes
:??
?
3preprocess/map_2/while/rotate/strided_slice_5/stackConst ^preprocess/map_2/while/Identity*%
valueB"                *
dtype0*
_output_shapes
:
?
5preprocess/map_2/while/rotate/strided_slice_5/stack_1Const ^preprocess/map_2/while/Identity*%
valueB"               *
dtype0*
_output_shapes
:
?
5preprocess/map_2/while/rotate/strided_slice_5/stack_2Const ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
:*%
valueB"            
?
-preprocess/map_2/while/rotate/strided_slice_5StridedSlice@preprocess/map_2/while/rotate/transform/ImageProjectiveTransform3preprocess/map_2/while/rotate/strided_slice_5/stack5preprocess/map_2/while/rotate/strided_slice_5/stack_15preprocess/map_2/while/rotate/strided_slice_5/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*$
_output_shapes
:??
?
:preprocess/map_2/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3@preprocess/map_2/while/TensorArrayWrite/TensorArrayWriteV3/Enterpreprocess/map_2/while/Identity-preprocess/map_2/while/rotate/strided_slice_5!preprocess/map_2/while/Identity_1*
T0*@
_class6
42loc:@preprocess/map_2/while/rotate/strided_slice_5*
_output_shapes
: 
?
@preprocess/map_2/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterpreprocess/map_2/TensorArray_1*
T0*@
_class6
42loc:@preprocess/map_2/while/rotate/strided_slice_5*
parallel_iterations
*
is_constant(*
_output_shapes
:*4

frame_name&$preprocess/map_2/while/while_context
?
preprocess/map_2/while/add/yConst ^preprocess/map_2/while/Identity*
dtype0*
_output_shapes
: *
value	B :
?
preprocess/map_2/while/addAddpreprocess/map_2/while/Identitypreprocess/map_2/while/add/y*
T0*
_output_shapes
: 
r
$preprocess/map_2/while/NextIterationNextIterationpreprocess/map_2/while/add*
T0*
_output_shapes
: 
?
&preprocess/map_2/while/NextIteration_1NextIteration:preprocess/map_2/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
c
preprocess/map_2/while/ExitExitpreprocess/map_2/while/Switch*
T0*
_output_shapes
: 
g
preprocess/map_2/while/Exit_1Exitpreprocess/map_2/while/Switch_1*
T0*
_output_shapes
: 
?
3preprocess/map_2/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3preprocess/map_2/TensorArray_1preprocess/map_2/while/Exit_1*1
_class'
%#loc:@preprocess/map_2/TensorArray_1*
_output_shapes
: 
?
-preprocess/map_2/TensorArrayStack/range/startConst*
dtype0*
_output_shapes
: *1
_class'
%#loc:@preprocess/map_2/TensorArray_1*
value	B : 
?
-preprocess/map_2/TensorArrayStack/range/deltaConst*1
_class'
%#loc:@preprocess/map_2/TensorArray_1*
value	B :*
dtype0*
_output_shapes
: 
?
'preprocess/map_2/TensorArrayStack/rangeRange-preprocess/map_2/TensorArrayStack/range/start3preprocess/map_2/TensorArrayStack/TensorArraySizeV3-preprocess/map_2/TensorArrayStack/range/delta*

Tidx0*1
_class'
%#loc:@preprocess/map_2/TensorArray_1*#
_output_shapes
:?????????
?
5preprocess/map_2/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3preprocess/map_2/TensorArray_1'preprocess/map_2/TensorArrayStack/rangepreprocess/map_2/while/Exit_1*!
element_shape:??*1
_class'
%#loc:@preprocess/map_2/TensorArray_1*
dtype0*1
_output_shapes
:???????????
?
preprocess/map_3/ShapeShape5preprocess/map_2/TensorArrayStack/TensorArrayGatherV3*
_output_shapes
:*
T0*
out_type0
n
$preprocess/map_3/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
p
&preprocess/map_3/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
p
&preprocess/map_3/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
preprocess/map_3/strided_sliceStridedSlicepreprocess/map_3/Shape$preprocess/map_3/strided_slice/stack&preprocess/map_3/strided_slice/stack_1&preprocess/map_3/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
preprocess/map_3/TensorArrayTensorArrayV3preprocess/map_3/strided_slice*
dtype0*
_output_shapes

:: *
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*
tensor_array_name 
?
)preprocess/map_3/TensorArrayUnstack/ShapeShape5preprocess/map_2/TensorArrayStack/TensorArrayGatherV3*
T0*
out_type0*
_output_shapes
:
?
7preprocess/map_3/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
9preprocess/map_3/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
9preprocess/map_3/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
1preprocess/map_3/TensorArrayUnstack/strided_sliceStridedSlice)preprocess/map_3/TensorArrayUnstack/Shape7preprocess/map_3/TensorArrayUnstack/strided_slice/stack9preprocess/map_3/TensorArrayUnstack/strided_slice/stack_19preprocess/map_3/TensorArrayUnstack/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
q
/preprocess/map_3/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
q
/preprocess/map_3/TensorArrayUnstack/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
)preprocess/map_3/TensorArrayUnstack/rangeRange/preprocess/map_3/TensorArrayUnstack/range/start1preprocess/map_3/TensorArrayUnstack/strided_slice/preprocess/map_3/TensorArrayUnstack/range/delta*

Tidx0*#
_output_shapes
:?????????
?
Kpreprocess/map_3/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3preprocess/map_3/TensorArray)preprocess/map_3/TensorArrayUnstack/range5preprocess/map_2/TensorArrayStack/TensorArrayGatherV3preprocess/map_3/TensorArray:1*
T0*1
_class'
%#loc:@preprocess/map_2/TensorArray_1*
_output_shapes
: 
X
preprocess/map_3/ConstConst*
value	B : *
dtype0*
_output_shapes
: 
?
preprocess/map_3/TensorArray_1TensorArrayV3preprocess/map_3/strided_slice*
tensor_array_name *
dtype0*
_output_shapes

:: *
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
?
preprocess/map_3/while/EnterEnterpreprocess/map_3/Const*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_3/while/while_context*
T0*
is_constant( 
?
preprocess/map_3/while/Enter_1Enter preprocess/map_3/TensorArray_1:1*
T0*
is_constant( *
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_3/while/while_context
?
preprocess/map_3/while/MergeMergepreprocess/map_3/while/Enter$preprocess/map_3/while/NextIteration*
T0*
N*
_output_shapes
: : 
?
preprocess/map_3/while/Merge_1Mergepreprocess/map_3/while/Enter_1&preprocess/map_3/while/NextIteration_1*
N*
_output_shapes
: : *
T0
?
preprocess/map_3/while/LessLesspreprocess/map_3/while/Merge!preprocess/map_3/while/Less/Enter*
T0*
_output_shapes
: 
?
!preprocess/map_3/while/Less/EnterEnterpreprocess/map_3/strided_slice*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_3/while/while_context
`
preprocess/map_3/while/LoopCondLoopCondpreprocess/map_3/while/Less*
_output_shapes
: 
?
preprocess/map_3/while/SwitchSwitchpreprocess/map_3/while/Mergepreprocess/map_3/while/LoopCond*
T0*/
_class%
#!loc:@preprocess/map_3/while/Merge*
_output_shapes
: : 
?
preprocess/map_3/while/Switch_1Switchpreprocess/map_3/while/Merge_1preprocess/map_3/while/LoopCond*
T0*1
_class'
%#loc:@preprocess/map_3/while/Merge_1*
_output_shapes
: : 
m
preprocess/map_3/while/IdentityIdentitypreprocess/map_3/while/Switch:1*
T0*
_output_shapes
: 
q
!preprocess/map_3/while/Identity_1Identity!preprocess/map_3/while/Switch_1:1*
_output_shapes
: *
T0
?
(preprocess/map_3/while/TensorArrayReadV3TensorArrayReadV3.preprocess/map_3/while/TensorArrayReadV3/Enterpreprocess/map_3/while/Identity0preprocess/map_3/while/TensorArrayReadV3/Enter_1*
dtype0*$
_output_shapes
:??
?
.preprocess/map_3/while/TensorArrayReadV3/EnterEnterpreprocess/map_3/TensorArray*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
:*4

frame_name&$preprocess/map_3/while/while_context
?
0preprocess/map_3/while/TensorArrayReadV3/Enter_1EnterKpreprocess/map_3/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_3/while/while_context
?
preprocess/map_3/while/ConstConst ^preprocess/map_3/while/Identity*!
valueB"p   p      *
dtype0*
_output_shapes
:
?
(preprocess/map_3/while/random_crop/ShapeConst ^preprocess/map_3/while/Identity*!
valueB"?   ?      *
dtype0*
_output_shapes
:
?
/preprocess/map_3/while/random_crop/GreaterEqualGreaterEqual(preprocess/map_3/while/random_crop/Shapepreprocess/map_3/while/Const*
T0*
_output_shapes
:
?
(preprocess/map_3/while/random_crop/ConstConst ^preprocess/map_3/while/Identity*
dtype0*
_output_shapes
:*
valueB: 
?
&preprocess/map_3/while/random_crop/AllAll/preprocess/map_3/while/random_crop/GreaterEqual(preprocess/map_3/while/random_crop/Const*
	keep_dims( *

Tidx0*
_output_shapes
: 
?
/preprocess/map_3/while/random_crop/Assert/ConstConst ^preprocess/map_3/while/Identity*/
value&B$ BNeed value.shape >= size, got *
dtype0*
_output_shapes
: 
?
7preprocess/map_3/while/random_crop/Assert/Assert/data_0Const ^preprocess/map_3/while/Identity*/
value&B$ BNeed value.shape >= size, got *
dtype0*
_output_shapes
: 
?
0preprocess/map_3/while/random_crop/Assert/AssertAssert&preprocess/map_3/while/random_crop/All7preprocess/map_3/while/random_crop/Assert/Assert/data_0(preprocess/map_3/while/random_crop/Shapepreprocess/map_3/while/Const*
T
2*
	summarize?
?
5preprocess/map_3/while/random_crop/control_dependencyIdentity(preprocess/map_3/while/random_crop/Shape1^preprocess/map_3/while/random_crop/Assert/Assert*
T0*;
_class1
/-loc:@preprocess/map_3/while/random_crop/Shape*
_output_shapes
:
?
&preprocess/map_3/while/random_crop/subSub5preprocess/map_3/while/random_crop/control_dependencypreprocess/map_3/while/Const*
_output_shapes
:*
T0
?
(preprocess/map_3/while/random_crop/add/yConst ^preprocess/map_3/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
?
&preprocess/map_3/while/random_crop/addAdd&preprocess/map_3/while/random_crop/sub(preprocess/map_3/while/random_crop/add/y*
T0*
_output_shapes
:
?
*preprocess/map_3/while/random_crop/Shape_1Const ^preprocess/map_3/while/Identity*
dtype0*
_output_shapes
:*
valueB:
?
5preprocess/map_3/while/random_crop/random_uniform/minConst ^preprocess/map_3/while/Identity*
value	B : *
dtype0*
_output_shapes
: 
?
5preprocess/map_3/while/random_crop/random_uniform/maxConst ^preprocess/map_3/while/Identity*
valueB :????*
dtype0*
_output_shapes
: 
?
1preprocess/map_3/while/random_crop/random_uniformRandomUniformInt*preprocess/map_3/while/random_crop/Shape_15preprocess/map_3/while/random_crop/random_uniform/min5preprocess/map_3/while/random_crop/random_uniform/max*
_output_shapes
:*
seed2 *

Tout0*

seed *
T0
?
&preprocess/map_3/while/random_crop/modFloorMod1preprocess/map_3/while/random_crop/random_uniform&preprocess/map_3/while/random_crop/add*
T0*
_output_shapes
:
?
"preprocess/map_3/while/random_cropSlice(preprocess/map_3/while/TensorArrayReadV3&preprocess/map_3/while/random_crop/modpreprocess/map_3/while/Const*
Index0*
T0*"
_output_shapes
:pp
?
:preprocess/map_3/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3@preprocess/map_3/while/TensorArrayWrite/TensorArrayWriteV3/Enterpreprocess/map_3/while/Identity"preprocess/map_3/while/random_crop!preprocess/map_3/while/Identity_1*
T0*5
_class+
)'loc:@preprocess/map_3/while/random_crop*
_output_shapes
: 
?
@preprocess/map_3/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterpreprocess/map_3/TensorArray_1*
is_constant(*
_output_shapes
:*4

frame_name&$preprocess/map_3/while/while_context*
T0*5
_class+
)'loc:@preprocess/map_3/while/random_crop*
parallel_iterations

?
preprocess/map_3/while/add/yConst ^preprocess/map_3/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
?
preprocess/map_3/while/addAddpreprocess/map_3/while/Identitypreprocess/map_3/while/add/y*
T0*
_output_shapes
: 
r
$preprocess/map_3/while/NextIterationNextIterationpreprocess/map_3/while/add*
T0*
_output_shapes
: 
?
&preprocess/map_3/while/NextIteration_1NextIteration:preprocess/map_3/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
c
preprocess/map_3/while/ExitExitpreprocess/map_3/while/Switch*
T0*
_output_shapes
: 
g
preprocess/map_3/while/Exit_1Exitpreprocess/map_3/while/Switch_1*
T0*
_output_shapes
: 
?
3preprocess/map_3/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3preprocess/map_3/TensorArray_1preprocess/map_3/while/Exit_1*1
_class'
%#loc:@preprocess/map_3/TensorArray_1*
_output_shapes
: 
?
-preprocess/map_3/TensorArrayStack/range/startConst*
dtype0*
_output_shapes
: *1
_class'
%#loc:@preprocess/map_3/TensorArray_1*
value	B : 
?
-preprocess/map_3/TensorArrayStack/range/deltaConst*1
_class'
%#loc:@preprocess/map_3/TensorArray_1*
value	B :*
dtype0*
_output_shapes
: 
?
'preprocess/map_3/TensorArrayStack/rangeRange-preprocess/map_3/TensorArrayStack/range/start3preprocess/map_3/TensorArrayStack/TensorArraySizeV3-preprocess/map_3/TensorArrayStack/range/delta*#
_output_shapes
:?????????*

Tidx0*1
_class'
%#loc:@preprocess/map_3/TensorArray_1
?
5preprocess/map_3/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3preprocess/map_3/TensorArray_1'preprocess/map_3/TensorArrayStack/rangepreprocess/map_3/while/Exit_1*
element_shape:pp*1
_class'
%#loc:@preprocess/map_3/TensorArray_1*
dtype0*/
_output_shapes
:?????????pp
a
preprocess/ConstConst*
valueB"@   @   *
dtype0*
_output_shapes
:
?
.preprocess/resize_images/ResizeNearestNeighborResizeNearestNeighbor5preprocess/map_3/TensorArrayStack/TensorArrayGatherV3preprocess/Const*
align_corners( *
T0*/
_output_shapes
:?????????@@
?
preprocess/map_4/ShapeShape.preprocess/resize_images/ResizeNearestNeighbor*
T0*
out_type0*
_output_shapes
:
n
$preprocess/map_4/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
p
&preprocess/map_4/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
p
&preprocess/map_4/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
preprocess/map_4/strided_sliceStridedSlicepreprocess/map_4/Shape$preprocess/map_4/strided_slice/stack&preprocess/map_4/strided_slice/stack_1&preprocess/map_4/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
preprocess/map_4/TensorArrayTensorArrayV3preprocess/map_4/strided_slice*
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*
tensor_array_name *
dtype0*
_output_shapes

:: 
?
)preprocess/map_4/TensorArrayUnstack/ShapeShape.preprocess/resize_images/ResizeNearestNeighbor*
T0*
out_type0*
_output_shapes
:
?
7preprocess/map_4/TensorArrayUnstack/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
?
9preprocess/map_4/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
9preprocess/map_4/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
1preprocess/map_4/TensorArrayUnstack/strided_sliceStridedSlice)preprocess/map_4/TensorArrayUnstack/Shape7preprocess/map_4/TensorArrayUnstack/strided_slice/stack9preprocess/map_4/TensorArrayUnstack/strided_slice/stack_19preprocess/map_4/TensorArrayUnstack/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
q
/preprocess/map_4/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
q
/preprocess/map_4/TensorArrayUnstack/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
)preprocess/map_4/TensorArrayUnstack/rangeRange/preprocess/map_4/TensorArrayUnstack/range/start1preprocess/map_4/TensorArrayUnstack/strided_slice/preprocess/map_4/TensorArrayUnstack/range/delta*#
_output_shapes
:?????????*

Tidx0
?
Kpreprocess/map_4/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3preprocess/map_4/TensorArray)preprocess/map_4/TensorArrayUnstack/range.preprocess/resize_images/ResizeNearestNeighborpreprocess/map_4/TensorArray:1*
_output_shapes
: *
T0*A
_class7
53loc:@preprocess/resize_images/ResizeNearestNeighbor
X
preprocess/map_4/ConstConst*
dtype0*
_output_shapes
: *
value	B : 
?
preprocess/map_4/TensorArray_1TensorArrayV3preprocess/map_4/strided_slice*
tensor_array_name *
dtype0*
_output_shapes

:: *
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
?
preprocess/map_4/while/EnterEnterpreprocess/map_4/Const*
T0*
is_constant( *
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_4/while/while_context
?
preprocess/map_4/while/Enter_1Enter preprocess/map_4/TensorArray_1:1*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_4/while/while_context*
T0*
is_constant( 
?
preprocess/map_4/while/MergeMergepreprocess/map_4/while/Enter$preprocess/map_4/while/NextIteration*
T0*
N*
_output_shapes
: : 
?
preprocess/map_4/while/Merge_1Mergepreprocess/map_4/while/Enter_1&preprocess/map_4/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
?
preprocess/map_4/while/LessLesspreprocess/map_4/while/Merge!preprocess/map_4/while/Less/Enter*
_output_shapes
: *
T0
?
!preprocess/map_4/while/Less/EnterEnterpreprocess/map_4/strided_slice*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_4/while/while_context
`
preprocess/map_4/while/LoopCondLoopCondpreprocess/map_4/while/Less*
_output_shapes
: 
?
preprocess/map_4/while/SwitchSwitchpreprocess/map_4/while/Mergepreprocess/map_4/while/LoopCond*
T0*/
_class%
#!loc:@preprocess/map_4/while/Merge*
_output_shapes
: : 
?
preprocess/map_4/while/Switch_1Switchpreprocess/map_4/while/Merge_1preprocess/map_4/while/LoopCond*
T0*1
_class'
%#loc:@preprocess/map_4/while/Merge_1*
_output_shapes
: : 
m
preprocess/map_4/while/IdentityIdentitypreprocess/map_4/while/Switch:1*
T0*
_output_shapes
: 
q
!preprocess/map_4/while/Identity_1Identity!preprocess/map_4/while/Switch_1:1*
T0*
_output_shapes
: 
?
(preprocess/map_4/while/TensorArrayReadV3TensorArrayReadV3.preprocess/map_4/while/TensorArrayReadV3/Enterpreprocess/map_4/while/Identity0preprocess/map_4/while/TensorArrayReadV3/Enter_1*
dtype0*"
_output_shapes
:@@
?
.preprocess/map_4/while/TensorArrayReadV3/EnterEnterpreprocess/map_4/TensorArray*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
:*4

frame_name&$preprocess/map_4/while/while_context
?
0preprocess/map_4/while/TensorArrayReadV3/Enter_1EnterKpreprocess/map_4/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_4/while/while_context
?
+preprocess/map_4/while/random_uniform/shapeConst ^preprocess/map_4/while/Identity*
dtype0*
_output_shapes
: *
valueB 
?
)preprocess/map_4/while/random_uniform/minConst ^preprocess/map_4/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *??L?
?
)preprocess/map_4/while/random_uniform/maxConst ^preprocess/map_4/while/Identity*
valueB
 *??L=*
dtype0*
_output_shapes
: 
?
3preprocess/map_4/while/random_uniform/RandomUniformRandomUniform+preprocess/map_4/while/random_uniform/shape*
dtype0*
_output_shapes
: *
seed2 *

seed *
T0
?
)preprocess/map_4/while/random_uniform/subSub)preprocess/map_4/while/random_uniform/max)preprocess/map_4/while/random_uniform/min*
T0*
_output_shapes
: 
?
)preprocess/map_4/while/random_uniform/mulMul3preprocess/map_4/while/random_uniform/RandomUniform)preprocess/map_4/while/random_uniform/sub*
_output_shapes
: *
T0
?
%preprocess/map_4/while/random_uniformAdd)preprocess/map_4/while/random_uniform/mul)preprocess/map_4/while/random_uniform/min*
T0*
_output_shapes
: 
?
1preprocess/map_4/while/adjust_brightness/IdentityIdentity(preprocess/map_4/while/TensorArrayReadV3*
T0*"
_output_shapes
:@@
?
(preprocess/map_4/while/adjust_brightnessAdd1preprocess/map_4/while/adjust_brightness/Identity%preprocess/map_4/while/random_uniform*
T0*"
_output_shapes
:@@
?
3preprocess/map_4/while/adjust_brightness/Identity_1Identity(preprocess/map_4/while/adjust_brightness*"
_output_shapes
:@@*
T0
?
:preprocess/map_4/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3@preprocess/map_4/while/TensorArrayWrite/TensorArrayWriteV3/Enterpreprocess/map_4/while/Identity3preprocess/map_4/while/adjust_brightness/Identity_1!preprocess/map_4/while/Identity_1*
_output_shapes
: *
T0*F
_class<
:8loc:@preprocess/map_4/while/adjust_brightness/Identity_1
?
@preprocess/map_4/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterpreprocess/map_4/TensorArray_1*
parallel_iterations
*
is_constant(*
_output_shapes
:*4

frame_name&$preprocess/map_4/while/while_context*
T0*F
_class<
:8loc:@preprocess/map_4/while/adjust_brightness/Identity_1
?
preprocess/map_4/while/add/yConst ^preprocess/map_4/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
?
preprocess/map_4/while/addAddpreprocess/map_4/while/Identitypreprocess/map_4/while/add/y*
T0*
_output_shapes
: 
r
$preprocess/map_4/while/NextIterationNextIterationpreprocess/map_4/while/add*
T0*
_output_shapes
: 
?
&preprocess/map_4/while/NextIteration_1NextIteration:preprocess/map_4/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
c
preprocess/map_4/while/ExitExitpreprocess/map_4/while/Switch*
_output_shapes
: *
T0
g
preprocess/map_4/while/Exit_1Exitpreprocess/map_4/while/Switch_1*
T0*
_output_shapes
: 
?
3preprocess/map_4/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3preprocess/map_4/TensorArray_1preprocess/map_4/while/Exit_1*
_output_shapes
: *1
_class'
%#loc:@preprocess/map_4/TensorArray_1
?
-preprocess/map_4/TensorArrayStack/range/startConst*
dtype0*
_output_shapes
: *1
_class'
%#loc:@preprocess/map_4/TensorArray_1*
value	B : 
?
-preprocess/map_4/TensorArrayStack/range/deltaConst*1
_class'
%#loc:@preprocess/map_4/TensorArray_1*
value	B :*
dtype0*
_output_shapes
: 
?
'preprocess/map_4/TensorArrayStack/rangeRange-preprocess/map_4/TensorArrayStack/range/start3preprocess/map_4/TensorArrayStack/TensorArraySizeV3-preprocess/map_4/TensorArrayStack/range/delta*#
_output_shapes
:?????????*

Tidx0*1
_class'
%#loc:@preprocess/map_4/TensorArray_1
?
5preprocess/map_4/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3preprocess/map_4/TensorArray_1'preprocess/map_4/TensorArrayStack/rangepreprocess/map_4/while/Exit_1*
element_shape:@@*1
_class'
%#loc:@preprocess/map_4/TensorArray_1*
dtype0*/
_output_shapes
:?????????@@
?
preprocess/map_5/ShapeShape5preprocess/map_4/TensorArrayStack/TensorArrayGatherV3*
T0*
out_type0*
_output_shapes
:
n
$preprocess/map_5/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
p
&preprocess/map_5/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
p
&preprocess/map_5/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
preprocess/map_5/strided_sliceStridedSlicepreprocess/map_5/Shape$preprocess/map_5/strided_slice/stack&preprocess/map_5/strided_slice/stack_1&preprocess/map_5/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
preprocess/map_5/TensorArrayTensorArrayV3preprocess/map_5/strided_slice*
tensor_array_name *
dtype0*
_output_shapes

:: *
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
?
)preprocess/map_5/TensorArrayUnstack/ShapeShape5preprocess/map_4/TensorArrayStack/TensorArrayGatherV3*
T0*
out_type0*
_output_shapes
:
?
7preprocess/map_5/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
9preprocess/map_5/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
9preprocess/map_5/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
1preprocess/map_5/TensorArrayUnstack/strided_sliceStridedSlice)preprocess/map_5/TensorArrayUnstack/Shape7preprocess/map_5/TensorArrayUnstack/strided_slice/stack9preprocess/map_5/TensorArrayUnstack/strided_slice/stack_19preprocess/map_5/TensorArrayUnstack/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
q
/preprocess/map_5/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
q
/preprocess/map_5/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
)preprocess/map_5/TensorArrayUnstack/rangeRange/preprocess/map_5/TensorArrayUnstack/range/start1preprocess/map_5/TensorArrayUnstack/strided_slice/preprocess/map_5/TensorArrayUnstack/range/delta*#
_output_shapes
:?????????*

Tidx0
?
Kpreprocess/map_5/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3preprocess/map_5/TensorArray)preprocess/map_5/TensorArrayUnstack/range5preprocess/map_4/TensorArrayStack/TensorArrayGatherV3preprocess/map_5/TensorArray:1*
_output_shapes
: *
T0*1
_class'
%#loc:@preprocess/map_4/TensorArray_1
X
preprocess/map_5/ConstConst*
value	B : *
dtype0*
_output_shapes
: 
?
preprocess/map_5/TensorArray_1TensorArrayV3preprocess/map_5/strided_slice*
dtype0*
_output_shapes

:: *
element_shape:*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*
tensor_array_name 
?
preprocess/map_5/while/EnterEnterpreprocess/map_5/Const*
T0*
is_constant( *
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_5/while/while_context
?
preprocess/map_5/while/Enter_1Enter preprocess/map_5/TensorArray_1:1*
T0*
is_constant( *
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_5/while/while_context
?
preprocess/map_5/while/MergeMergepreprocess/map_5/while/Enter$preprocess/map_5/while/NextIteration*
T0*
N*
_output_shapes
: : 
?
preprocess/map_5/while/Merge_1Mergepreprocess/map_5/while/Enter_1&preprocess/map_5/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
?
preprocess/map_5/while/LessLesspreprocess/map_5/while/Merge!preprocess/map_5/while/Less/Enter*
T0*
_output_shapes
: 
?
!preprocess/map_5/while/Less/EnterEnterpreprocess/map_5/strided_slice*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_5/while/while_context
`
preprocess/map_5/while/LoopCondLoopCondpreprocess/map_5/while/Less*
_output_shapes
: 
?
preprocess/map_5/while/SwitchSwitchpreprocess/map_5/while/Mergepreprocess/map_5/while/LoopCond*
_output_shapes
: : *
T0*/
_class%
#!loc:@preprocess/map_5/while/Merge
?
preprocess/map_5/while/Switch_1Switchpreprocess/map_5/while/Merge_1preprocess/map_5/while/LoopCond*
T0*1
_class'
%#loc:@preprocess/map_5/while/Merge_1*
_output_shapes
: : 
m
preprocess/map_5/while/IdentityIdentitypreprocess/map_5/while/Switch:1*
_output_shapes
: *
T0
q
!preprocess/map_5/while/Identity_1Identity!preprocess/map_5/while/Switch_1:1*
T0*
_output_shapes
: 
?
(preprocess/map_5/while/TensorArrayReadV3TensorArrayReadV3.preprocess/map_5/while/TensorArrayReadV3/Enterpreprocess/map_5/while/Identity0preprocess/map_5/while/TensorArrayReadV3/Enter_1*
dtype0*"
_output_shapes
:@@
?
.preprocess/map_5/while/TensorArrayReadV3/EnterEnterpreprocess/map_5/TensorArray*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
:*4

frame_name&$preprocess/map_5/while/while_context
?
0preprocess/map_5/while/TensorArrayReadV3/Enter_1EnterKpreprocess/map_5/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations
*
_output_shapes
: *4

frame_name&$preprocess/map_5/while/while_context
?
+preprocess/map_5/while/random_uniform/shapeConst ^preprocess/map_5/while/Identity*
dtype0*
_output_shapes
: *
valueB 
?
)preprocess/map_5/while/random_uniform/minConst ^preprocess/map_5/while/Identity*
dtype0*
_output_shapes
: *
valueB
 *33s?
?
)preprocess/map_5/while/random_uniform/maxConst ^preprocess/map_5/while/Identity*
valueB
 *ff??*
dtype0*
_output_shapes
: 
?
3preprocess/map_5/while/random_uniform/RandomUniformRandomUniform+preprocess/map_5/while/random_uniform/shape*
dtype0*
_output_shapes
: *
seed2 *

seed *
T0
?
)preprocess/map_5/while/random_uniform/subSub)preprocess/map_5/while/random_uniform/max)preprocess/map_5/while/random_uniform/min*
T0*
_output_shapes
: 
?
)preprocess/map_5/while/random_uniform/mulMul3preprocess/map_5/while/random_uniform/RandomUniform)preprocess/map_5/while/random_uniform/sub*
_output_shapes
: *
T0
?
%preprocess/map_5/while/random_uniformAdd)preprocess/map_5/while/random_uniform/mul)preprocess/map_5/while/random_uniform/min*
T0*
_output_shapes
: 
?
/preprocess/map_5/while/adjust_contrast/IdentityIdentity(preprocess/map_5/while/TensorArrayReadV3*"
_output_shapes
:@@*
T0
?
&preprocess/map_5/while/adjust_contrastAdjustContrastv2/preprocess/map_5/while/adjust_contrast/Identity%preprocess/map_5/while/random_uniform*"
_output_shapes
:@@
?
1preprocess/map_5/while/adjust_contrast/Identity_1Identity&preprocess/map_5/while/adjust_contrast*
T0*"
_output_shapes
:@@
?
:preprocess/map_5/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3@preprocess/map_5/while/TensorArrayWrite/TensorArrayWriteV3/Enterpreprocess/map_5/while/Identity1preprocess/map_5/while/adjust_contrast/Identity_1!preprocess/map_5/while/Identity_1*
T0*D
_class:
86loc:@preprocess/map_5/while/adjust_contrast/Identity_1*
_output_shapes
: 
?
@preprocess/map_5/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterpreprocess/map_5/TensorArray_1*
T0*D
_class:
86loc:@preprocess/map_5/while/adjust_contrast/Identity_1*
parallel_iterations
*
is_constant(*
_output_shapes
:*4

frame_name&$preprocess/map_5/while/while_context
?
preprocess/map_5/while/add/yConst ^preprocess/map_5/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
?
preprocess/map_5/while/addAddpreprocess/map_5/while/Identitypreprocess/map_5/while/add/y*
_output_shapes
: *
T0
r
$preprocess/map_5/while/NextIterationNextIterationpreprocess/map_5/while/add*
T0*
_output_shapes
: 
?
&preprocess/map_5/while/NextIteration_1NextIteration:preprocess/map_5/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
c
preprocess/map_5/while/ExitExitpreprocess/map_5/while/Switch*
T0*
_output_shapes
: 
g
preprocess/map_5/while/Exit_1Exitpreprocess/map_5/while/Switch_1*
T0*
_output_shapes
: 
?
3preprocess/map_5/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3preprocess/map_5/TensorArray_1preprocess/map_5/while/Exit_1*
_output_shapes
: *1
_class'
%#loc:@preprocess/map_5/TensorArray_1
?
-preprocess/map_5/TensorArrayStack/range/startConst*1
_class'
%#loc:@preprocess/map_5/TensorArray_1*
value	B : *
dtype0*
_output_shapes
: 
?
-preprocess/map_5/TensorArrayStack/range/deltaConst*1
_class'
%#loc:@preprocess/map_5/TensorArray_1*
value	B :*
dtype0*
_output_shapes
: 
?
'preprocess/map_5/TensorArrayStack/rangeRange-preprocess/map_5/TensorArrayStack/range/start3preprocess/map_5/TensorArrayStack/TensorArraySizeV3-preprocess/map_5/TensorArrayStack/range/delta*1
_class'
%#loc:@preprocess/map_5/TensorArray_1*#
_output_shapes
:?????????*

Tidx0
?
5preprocess/map_5/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3preprocess/map_5/TensorArray_1'preprocess/map_5/TensorArrayStack/rangepreprocess/map_5/while/Exit_1*
element_shape:@@*1
_class'
%#loc:@preprocess/map_5/TensorArray_1*
dtype0*/
_output_shapes
:?????????@@
q
preprocess/c_augmented/tagConst*'
valueB Bpreprocess/c_augmented*
dtype0*
_output_shapes
: 
?
preprocess/c_augmentedImageSummarypreprocess/c_augmented/tag5preprocess/map_5/TensorArrayStack/TensorArrayGatherV3*
T0*
	bad_colorB:?  ?*
_output_shapes
: *

max_images
[
model_input/tagConst*
valueB Bmodel_input*
dtype0*
_output_shapes
: 
?
model_inputImageSummarymodel_input/tag5preprocess/map_5/TensorArrayStack/TensorArrayGatherV3*
T0*
	bad_colorB:?  ?*
_output_shapes
: *

max_images
?
:model/layer1/conv1/kernel/Initializer/random_uniform/shapeConst*,
_class"
 loc:@model/layer1/conv1/kernel*%
valueB"         ?   *
dtype0*
_output_shapes
:
?
8model/layer1/conv1/kernel/Initializer/random_uniform/minConst*,
_class"
 loc:@model/layer1/conv1/kernel*
valueB
 *I:??*
dtype0*
_output_shapes
: 
?
8model/layer1/conv1/kernel/Initializer/random_uniform/maxConst*,
_class"
 loc:@model/layer1/conv1/kernel*
valueB
 *I:?=*
dtype0*
_output_shapes
: 
?
Bmodel/layer1/conv1/kernel/Initializer/random_uniform/RandomUniformRandomUniform:model/layer1/conv1/kernel/Initializer/random_uniform/shape*
dtype0*'
_output_shapes
:?*

seed *
T0*,
_class"
 loc:@model/layer1/conv1/kernel*
seed2 
?
8model/layer1/conv1/kernel/Initializer/random_uniform/subSub8model/layer1/conv1/kernel/Initializer/random_uniform/max8model/layer1/conv1/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@model/layer1/conv1/kernel*
_output_shapes
: 
?
8model/layer1/conv1/kernel/Initializer/random_uniform/mulMulBmodel/layer1/conv1/kernel/Initializer/random_uniform/RandomUniform8model/layer1/conv1/kernel/Initializer/random_uniform/sub*
T0*,
_class"
 loc:@model/layer1/conv1/kernel*'
_output_shapes
:?
?
4model/layer1/conv1/kernel/Initializer/random_uniformAdd8model/layer1/conv1/kernel/Initializer/random_uniform/mul8model/layer1/conv1/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@model/layer1/conv1/kernel*'
_output_shapes
:?
?
model/layer1/conv1/kernel
VariableV2*,
_class"
 loc:@model/layer1/conv1/kernel*
	container *
shape:?*
dtype0*'
_output_shapes
:?*
shared_name 
?
 model/layer1/conv1/kernel/AssignAssignmodel/layer1/conv1/kernel4model/layer1/conv1/kernel/Initializer/random_uniform*
use_locking(*
T0*,
_class"
 loc:@model/layer1/conv1/kernel*
validate_shape(*'
_output_shapes
:?
?
model/layer1/conv1/kernel/readIdentitymodel/layer1/conv1/kernel*
T0*,
_class"
 loc:@model/layer1/conv1/kernel*'
_output_shapes
:?
?
)model/layer1/conv1/bias/Initializer/zerosConst**
_class 
loc:@model/layer1/conv1/bias*
valueB?*    *
dtype0*
_output_shapes	
:?
?
model/layer1/conv1/bias
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name **
_class 
loc:@model/layer1/conv1/bias
?
model/layer1/conv1/bias/AssignAssignmodel/layer1/conv1/bias)model/layer1/conv1/bias/Initializer/zeros*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0**
_class 
loc:@model/layer1/conv1/bias
?
model/layer1/conv1/bias/readIdentitymodel/layer1/conv1/bias*
T0**
_class 
loc:@model/layer1/conv1/bias*
_output_shapes	
:?
q
 model/layer1/conv1/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
model/layer1/conv1/Conv2DConv2D5preprocess/map_5/TensorArrayStack/TensorArrayGatherV3model/layer1/conv1/kernel/read*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME*0
_output_shapes
:?????????@@?*
	dilations

?
model/layer1/conv1/BiasAddBiasAddmodel/layer1/conv1/Conv2Dmodel/layer1/conv1/bias/read*
data_formatNHWC*0
_output_shapes
:?????????@@?*
T0
?
*batch_normalization/gamma/Initializer/onesConst*,
_class"
 loc:@batch_normalization/gamma*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
batch_normalization/gamma
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *,
_class"
 loc:@batch_normalization/gamma*
	container *
shape:?
?
 batch_normalization/gamma/AssignAssignbatch_normalization/gamma*batch_normalization/gamma/Initializer/ones*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*,
_class"
 loc:@batch_normalization/gamma
?
batch_normalization/gamma/readIdentitybatch_normalization/gamma*
T0*,
_class"
 loc:@batch_normalization/gamma*
_output_shapes	
:?
?
*batch_normalization/beta/Initializer/zerosConst*+
_class!
loc:@batch_normalization/beta*
valueB?*    *
dtype0*
_output_shapes	
:?
?
batch_normalization/beta
VariableV2*
shared_name *+
_class!
loc:@batch_normalization/beta*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
batch_normalization/beta/AssignAssignbatch_normalization/beta*batch_normalization/beta/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@batch_normalization/beta*
validate_shape(*
_output_shapes	
:?
?
batch_normalization/beta/readIdentitybatch_normalization/beta*
T0*+
_class!
loc:@batch_normalization/beta*
_output_shapes	
:?
?
1batch_normalization/moving_mean/Initializer/zerosConst*2
_class(
&$loc:@batch_normalization/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
batch_normalization/moving_mean
VariableV2*2
_class(
&$loc:@batch_normalization/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
&batch_normalization/moving_mean/AssignAssignbatch_normalization/moving_mean1batch_normalization/moving_mean/Initializer/zeros*
use_locking(*
T0*2
_class(
&$loc:@batch_normalization/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$batch_normalization/moving_mean/readIdentitybatch_normalization/moving_mean*
T0*2
_class(
&$loc:@batch_normalization/moving_mean*
_output_shapes	
:?
?
4batch_normalization/moving_variance/Initializer/onesConst*6
_class,
*(loc:@batch_normalization/moving_variance*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
#batch_normalization/moving_variance
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *6
_class,
*(loc:@batch_normalization/moving_variance*
	container *
shape:?
?
*batch_normalization/moving_variance/AssignAssign#batch_normalization/moving_variance4batch_normalization/moving_variance/Initializer/ones*
use_locking(*
T0*6
_class,
*(loc:@batch_normalization/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(batch_normalization/moving_variance/readIdentity#batch_normalization/moving_variance*
T0*6
_class,
*(loc:@batch_normalization/moving_variance*
_output_shapes	
:?
?
"batch_normalization/FusedBatchNormFusedBatchNormmodel/layer1/conv1/BiasAddbatch_normalization/gamma/readbatch_normalization/beta/read$batch_normalization/moving_mean/read(batch_normalization/moving_variance/read*
epsilon%o?:*
T0*
data_formatNHWC*L
_output_shapes:
8:?????????@@?:?:?:?:?*
is_training( 
^
batch_normalization/ConstConst*
valueB
 *?p}?*
dtype0*
_output_shapes
: 
k
ReluRelu"batch_normalization/FusedBatchNorm*
T0*0
_output_shapes
:?????????@@?
?
model/layer1/pool1/MaxPoolMaxPoolRelu*
T0*
data_formatNHWC*
strides
*
ksize
*
paddingVALID*0
_output_shapes
:?????????  ?
?
:model/layer2/conv2/kernel/Initializer/random_uniform/shapeConst*,
_class"
 loc:@model/layer2/conv2/kernel*%
valueB"      ?   @   *
dtype0*
_output_shapes
:
?
8model/layer2/conv2/kernel/Initializer/random_uniform/minConst*,
_class"
 loc:@model/layer2/conv2/kernel*
valueB
 *?[q?*
dtype0*
_output_shapes
: 
?
8model/layer2/conv2/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *,
_class"
 loc:@model/layer2/conv2/kernel*
valueB
 *?[q=
?
Bmodel/layer2/conv2/kernel/Initializer/random_uniform/RandomUniformRandomUniform:model/layer2/conv2/kernel/Initializer/random_uniform/shape*
dtype0*'
_output_shapes
:?@*

seed *
T0*,
_class"
 loc:@model/layer2/conv2/kernel*
seed2 
?
8model/layer2/conv2/kernel/Initializer/random_uniform/subSub8model/layer2/conv2/kernel/Initializer/random_uniform/max8model/layer2/conv2/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@model/layer2/conv2/kernel*
_output_shapes
: 
?
8model/layer2/conv2/kernel/Initializer/random_uniform/mulMulBmodel/layer2/conv2/kernel/Initializer/random_uniform/RandomUniform8model/layer2/conv2/kernel/Initializer/random_uniform/sub*
T0*,
_class"
 loc:@model/layer2/conv2/kernel*'
_output_shapes
:?@
?
4model/layer2/conv2/kernel/Initializer/random_uniformAdd8model/layer2/conv2/kernel/Initializer/random_uniform/mul8model/layer2/conv2/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@model/layer2/conv2/kernel*'
_output_shapes
:?@
?
model/layer2/conv2/kernel
VariableV2*,
_class"
 loc:@model/layer2/conv2/kernel*
	container *
shape:?@*
dtype0*'
_output_shapes
:?@*
shared_name 
?
 model/layer2/conv2/kernel/AssignAssignmodel/layer2/conv2/kernel4model/layer2/conv2/kernel/Initializer/random_uniform*
use_locking(*
T0*,
_class"
 loc:@model/layer2/conv2/kernel*
validate_shape(*'
_output_shapes
:?@
?
model/layer2/conv2/kernel/readIdentitymodel/layer2/conv2/kernel*
T0*,
_class"
 loc:@model/layer2/conv2/kernel*'
_output_shapes
:?@
?
)model/layer2/conv2/bias/Initializer/zerosConst**
_class 
loc:@model/layer2/conv2/bias*
valueB@*    *
dtype0*
_output_shapes
:@
?
model/layer2/conv2/bias
VariableV2*
dtype0*
_output_shapes
:@*
shared_name **
_class 
loc:@model/layer2/conv2/bias*
	container *
shape:@
?
model/layer2/conv2/bias/AssignAssignmodel/layer2/conv2/bias)model/layer2/conv2/bias/Initializer/zeros*
use_locking(*
T0**
_class 
loc:@model/layer2/conv2/bias*
validate_shape(*
_output_shapes
:@
?
model/layer2/conv2/bias/readIdentitymodel/layer2/conv2/bias*
T0**
_class 
loc:@model/layer2/conv2/bias*
_output_shapes
:@
q
 model/layer2/conv2/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
model/layer2/conv2/Conv2DConv2Dmodel/layer1/pool1/MaxPoolmodel/layer2/conv2/kernel/read*/
_output_shapes
:?????????  @*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME
?
model/layer2/conv2/BiasAddBiasAddmodel/layer2/conv2/Conv2Dmodel/layer2/conv2/bias/read*
T0*
data_formatNHWC*/
_output_shapes
:?????????  @
?
,batch_normalization_1/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:@*.
_class$
" loc:@batch_normalization_1/gamma*
valueB@*  ??
?
batch_normalization_1/gamma
VariableV2*
	container *
shape:@*
dtype0*
_output_shapes
:@*
shared_name *.
_class$
" loc:@batch_normalization_1/gamma
?
"batch_normalization_1/gamma/AssignAssignbatch_normalization_1/gamma,batch_normalization_1/gamma/Initializer/ones*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_1/gamma*
validate_shape(*
_output_shapes
:@
?
 batch_normalization_1/gamma/readIdentitybatch_normalization_1/gamma*
_output_shapes
:@*
T0*.
_class$
" loc:@batch_normalization_1/gamma
?
,batch_normalization_1/beta/Initializer/zerosConst*-
_class#
!loc:@batch_normalization_1/beta*
valueB@*    *
dtype0*
_output_shapes
:@
?
batch_normalization_1/beta
VariableV2*
	container *
shape:@*
dtype0*
_output_shapes
:@*
shared_name *-
_class#
!loc:@batch_normalization_1/beta
?
!batch_normalization_1/beta/AssignAssignbatch_normalization_1/beta,batch_normalization_1/beta/Initializer/zeros*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_1/beta
?
batch_normalization_1/beta/readIdentitybatch_normalization_1/beta*
T0*-
_class#
!loc:@batch_normalization_1/beta*
_output_shapes
:@
?
3batch_normalization_1/moving_mean/Initializer/zerosConst*4
_class*
(&loc:@batch_normalization_1/moving_mean*
valueB@*    *
dtype0*
_output_shapes
:@
?
!batch_normalization_1/moving_mean
VariableV2*
dtype0*
_output_shapes
:@*
shared_name *4
_class*
(&loc:@batch_normalization_1/moving_mean*
	container *
shape:@
?
(batch_normalization_1/moving_mean/AssignAssign!batch_normalization_1/moving_mean3batch_normalization_1/moving_mean/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean*
validate_shape(*
_output_shapes
:@
?
&batch_normalization_1/moving_mean/readIdentity!batch_normalization_1/moving_mean*
_output_shapes
:@*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean
?
6batch_normalization_1/moving_variance/Initializer/onesConst*8
_class.
,*loc:@batch_normalization_1/moving_variance*
valueB@*  ??*
dtype0*
_output_shapes
:@
?
%batch_normalization_1/moving_variance
VariableV2*
dtype0*
_output_shapes
:@*
shared_name *8
_class.
,*loc:@batch_normalization_1/moving_variance*
	container *
shape:@
?
,batch_normalization_1/moving_variance/AssignAssign%batch_normalization_1/moving_variance6batch_normalization_1/moving_variance/Initializer/ones*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
validate_shape(*
_output_shapes
:@*
use_locking(
?
*batch_normalization_1/moving_variance/readIdentity%batch_normalization_1/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
_output_shapes
:@
?
$batch_normalization_1/FusedBatchNormFusedBatchNormmodel/layer2/conv2/BiasAdd batch_normalization_1/gamma/readbatch_normalization_1/beta/read&batch_normalization_1/moving_mean/read*batch_normalization_1/moving_variance/read*
epsilon%o?:*
T0*
data_formatNHWC*G
_output_shapes5
3:?????????  @:@:@:@:@*
is_training( 
`
batch_normalization_1/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *?p}?
n
Relu_1Relu$batch_normalization_1/FusedBatchNorm*
T0*/
_output_shapes
:?????????  @
?
model/layer2/pool2/MaxPoolMaxPoolRelu_1*
T0*
data_formatNHWC*
strides
*
ksize
*
paddingVALID*/
_output_shapes
:?????????@
?
:model/layer3/conv3/kernel/Initializer/random_uniform/shapeConst*,
_class"
 loc:@model/layer3/conv3/kernel*%
valueB"      @   @   *
dtype0*
_output_shapes
:
?
8model/layer3/conv3/kernel/Initializer/random_uniform/minConst*,
_class"
 loc:@model/layer3/conv3/kernel*
valueB
 *:͓?*
dtype0*
_output_shapes
: 
?
8model/layer3/conv3/kernel/Initializer/random_uniform/maxConst*,
_class"
 loc:@model/layer3/conv3/kernel*
valueB
 *:͓=*
dtype0*
_output_shapes
: 
?
Bmodel/layer3/conv3/kernel/Initializer/random_uniform/RandomUniformRandomUniform:model/layer3/conv3/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
:@@*

seed *
T0*,
_class"
 loc:@model/layer3/conv3/kernel*
seed2 
?
8model/layer3/conv3/kernel/Initializer/random_uniform/subSub8model/layer3/conv3/kernel/Initializer/random_uniform/max8model/layer3/conv3/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*,
_class"
 loc:@model/layer3/conv3/kernel
?
8model/layer3/conv3/kernel/Initializer/random_uniform/mulMulBmodel/layer3/conv3/kernel/Initializer/random_uniform/RandomUniform8model/layer3/conv3/kernel/Initializer/random_uniform/sub*
T0*,
_class"
 loc:@model/layer3/conv3/kernel*&
_output_shapes
:@@
?
4model/layer3/conv3/kernel/Initializer/random_uniformAdd8model/layer3/conv3/kernel/Initializer/random_uniform/mul8model/layer3/conv3/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@model/layer3/conv3/kernel*&
_output_shapes
:@@
?
model/layer3/conv3/kernel
VariableV2*,
_class"
 loc:@model/layer3/conv3/kernel*
	container *
shape:@@*
dtype0*&
_output_shapes
:@@*
shared_name 
?
 model/layer3/conv3/kernel/AssignAssignmodel/layer3/conv3/kernel4model/layer3/conv3/kernel/Initializer/random_uniform*
validate_shape(*&
_output_shapes
:@@*
use_locking(*
T0*,
_class"
 loc:@model/layer3/conv3/kernel
?
model/layer3/conv3/kernel/readIdentitymodel/layer3/conv3/kernel*
T0*,
_class"
 loc:@model/layer3/conv3/kernel*&
_output_shapes
:@@
?
)model/layer3/conv3/bias/Initializer/zerosConst**
_class 
loc:@model/layer3/conv3/bias*
valueB@*    *
dtype0*
_output_shapes
:@
?
model/layer3/conv3/bias
VariableV2*
	container *
shape:@*
dtype0*
_output_shapes
:@*
shared_name **
_class 
loc:@model/layer3/conv3/bias
?
model/layer3/conv3/bias/AssignAssignmodel/layer3/conv3/bias)model/layer3/conv3/bias/Initializer/zeros*
use_locking(*
T0**
_class 
loc:@model/layer3/conv3/bias*
validate_shape(*
_output_shapes
:@
?
model/layer3/conv3/bias/readIdentitymodel/layer3/conv3/bias*
T0**
_class 
loc:@model/layer3/conv3/bias*
_output_shapes
:@
q
 model/layer3/conv3/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
model/layer3/conv3/Conv2DConv2Dmodel/layer2/pool2/MaxPoolmodel/layer3/conv3/kernel/read*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME*/
_output_shapes
:?????????@*
	dilations
*
T0
?
model/layer3/conv3/BiasAddBiasAddmodel/layer3/conv3/Conv2Dmodel/layer3/conv3/bias/read*
T0*
data_formatNHWC*/
_output_shapes
:?????????@
?
,batch_normalization_2/gamma/Initializer/onesConst*
dtype0*
_output_shapes
:@*.
_class$
" loc:@batch_normalization_2/gamma*
valueB@*  ??
?
batch_normalization_2/gamma
VariableV2*
dtype0*
_output_shapes
:@*
shared_name *.
_class$
" loc:@batch_normalization_2/gamma*
	container *
shape:@
?
"batch_normalization_2/gamma/AssignAssignbatch_normalization_2/gamma,batch_normalization_2/gamma/Initializer/ones*
T0*.
_class$
" loc:@batch_normalization_2/gamma*
validate_shape(*
_output_shapes
:@*
use_locking(
?
 batch_normalization_2/gamma/readIdentitybatch_normalization_2/gamma*
_output_shapes
:@*
T0*.
_class$
" loc:@batch_normalization_2/gamma
?
,batch_normalization_2/beta/Initializer/zerosConst*-
_class#
!loc:@batch_normalization_2/beta*
valueB@*    *
dtype0*
_output_shapes
:@
?
batch_normalization_2/beta
VariableV2*-
_class#
!loc:@batch_normalization_2/beta*
	container *
shape:@*
dtype0*
_output_shapes
:@*
shared_name 
?
!batch_normalization_2/beta/AssignAssignbatch_normalization_2/beta,batch_normalization_2/beta/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_2/beta*
validate_shape(*
_output_shapes
:@
?
batch_normalization_2/beta/readIdentitybatch_normalization_2/beta*
T0*-
_class#
!loc:@batch_normalization_2/beta*
_output_shapes
:@
?
3batch_normalization_2/moving_mean/Initializer/zerosConst*4
_class*
(&loc:@batch_normalization_2/moving_mean*
valueB@*    *
dtype0*
_output_shapes
:@
?
!batch_normalization_2/moving_mean
VariableV2*
shared_name *4
_class*
(&loc:@batch_normalization_2/moving_mean*
	container *
shape:@*
dtype0*
_output_shapes
:@
?
(batch_normalization_2/moving_mean/AssignAssign!batch_normalization_2/moving_mean3batch_normalization_2/moving_mean/Initializer/zeros*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
validate_shape(*
_output_shapes
:@*
use_locking(
?
&batch_normalization_2/moving_mean/readIdentity!batch_normalization_2/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
_output_shapes
:@
?
6batch_normalization_2/moving_variance/Initializer/onesConst*8
_class.
,*loc:@batch_normalization_2/moving_variance*
valueB@*  ??*
dtype0*
_output_shapes
:@
?
%batch_normalization_2/moving_variance
VariableV2*
shared_name *8
_class.
,*loc:@batch_normalization_2/moving_variance*
	container *
shape:@*
dtype0*
_output_shapes
:@
?
,batch_normalization_2/moving_variance/AssignAssign%batch_normalization_2/moving_variance6batch_normalization_2/moving_variance/Initializer/ones*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
validate_shape(*
_output_shapes
:@
?
*batch_normalization_2/moving_variance/readIdentity%batch_normalization_2/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
_output_shapes
:@
?
$batch_normalization_2/FusedBatchNormFusedBatchNormmodel/layer3/conv3/BiasAdd batch_normalization_2/gamma/readbatch_normalization_2/beta/read&batch_normalization_2/moving_mean/read*batch_normalization_2/moving_variance/read*
epsilon%o?:*
T0*
data_formatNHWC*G
_output_shapes5
3:?????????@:@:@:@:@*
is_training( 
`
batch_normalization_2/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *?p}?
n
Relu_2Relu$batch_normalization_2/FusedBatchNorm*
T0*/
_output_shapes
:?????????@
?
model/layer3/pool3/MaxPoolMaxPoolRelu_2*/
_output_shapes
:?????????@*
T0*
data_formatNHWC*
strides
*
ksize
*
paddingVALID
h
model/layer3/flat/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
model/layer3/flatReshapemodel/layer3/pool3/MaxPoolmodel/layer3/flat/shape*(
_output_shapes
:?????????? *
T0*
Tshape0
?
;model/layer4/dense1/kernel/Initializer/random_uniform/shapeConst*-
_class#
!loc:@model/layer4/dense1/kernel*
valueB"   ?   *
dtype0*
_output_shapes
:
?
9model/layer4/dense1/kernel/Initializer/random_uniform/minConst*-
_class#
!loc:@model/layer4/dense1/kernel*
valueB
 *?_?*
dtype0*
_output_shapes
: 
?
9model/layer4/dense1/kernel/Initializer/random_uniform/maxConst*-
_class#
!loc:@model/layer4/dense1/kernel*
valueB
 *?_=*
dtype0*
_output_shapes
: 
?
Cmodel/layer4/dense1/kernel/Initializer/random_uniform/RandomUniformRandomUniform;model/layer4/dense1/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
? ?*

seed *
T0*-
_class#
!loc:@model/layer4/dense1/kernel*
seed2 
?
9model/layer4/dense1/kernel/Initializer/random_uniform/subSub9model/layer4/dense1/kernel/Initializer/random_uniform/max9model/layer4/dense1/kernel/Initializer/random_uniform/min*
T0*-
_class#
!loc:@model/layer4/dense1/kernel*
_output_shapes
: 
?
9model/layer4/dense1/kernel/Initializer/random_uniform/mulMulCmodel/layer4/dense1/kernel/Initializer/random_uniform/RandomUniform9model/layer4/dense1/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
? ?*
T0*-
_class#
!loc:@model/layer4/dense1/kernel
?
5model/layer4/dense1/kernel/Initializer/random_uniformAdd9model/layer4/dense1/kernel/Initializer/random_uniform/mul9model/layer4/dense1/kernel/Initializer/random_uniform/min*
T0*-
_class#
!loc:@model/layer4/dense1/kernel* 
_output_shapes
:
? ?
?
model/layer4/dense1/kernel
VariableV2*
dtype0* 
_output_shapes
:
? ?*
shared_name *-
_class#
!loc:@model/layer4/dense1/kernel*
	container *
shape:
? ?
?
!model/layer4/dense1/kernel/AssignAssignmodel/layer4/dense1/kernel5model/layer4/dense1/kernel/Initializer/random_uniform*
use_locking(*
T0*-
_class#
!loc:@model/layer4/dense1/kernel*
validate_shape(* 
_output_shapes
:
? ?
?
model/layer4/dense1/kernel/readIdentitymodel/layer4/dense1/kernel*
T0*-
_class#
!loc:@model/layer4/dense1/kernel* 
_output_shapes
:
? ?
?
*model/layer4/dense1/bias/Initializer/zerosConst*
dtype0*
_output_shapes	
:?*+
_class!
loc:@model/layer4/dense1/bias*
valueB?*    
?
model/layer4/dense1/bias
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *+
_class!
loc:@model/layer4/dense1/bias*
	container *
shape:?
?
model/layer4/dense1/bias/AssignAssignmodel/layer4/dense1/bias*model/layer4/dense1/bias/Initializer/zeros*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@model/layer4/dense1/bias
?
model/layer4/dense1/bias/readIdentitymodel/layer4/dense1/bias*
_output_shapes	
:?*
T0*+
_class!
loc:@model/layer4/dense1/bias
?
model/layer4/dense1/MatMulMatMulmodel/layer3/flatmodel/layer4/dense1/kernel/read*
T0*(
_output_shapes
:??????????*
transpose_a( *
transpose_b( 
?
model/layer4/dense1/BiasAddBiasAddmodel/layer4/dense1/MatMulmodel/layer4/dense1/bias/read*
data_formatNHWC*(
_output_shapes
:??????????*
T0
p
model/layer4/dense1/ReluRelumodel/layer4/dense1/BiasAdd*
T0*(
_output_shapes
:??????????
e
 sample/dropout/dropout/keep_probConst*
valueB
 *   ?*
dtype0*
_output_shapes
: 
t
sample/dropout/dropout/ShapeShapemodel/layer4/dense1/Relu*
T0*
out_type0*
_output_shapes
:
n
)sample/dropout/dropout/random_uniform/minConst*
valueB
 *    *
dtype0*
_output_shapes
: 
n
)sample/dropout/dropout/random_uniform/maxConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
3sample/dropout/dropout/random_uniform/RandomUniformRandomUniformsample/dropout/dropout/Shape*
T0*
dtype0*(
_output_shapes
:??????????*
seed2 *

seed 
?
)sample/dropout/dropout/random_uniform/subSub)sample/dropout/dropout/random_uniform/max)sample/dropout/dropout/random_uniform/min*
T0*
_output_shapes
: 
?
)sample/dropout/dropout/random_uniform/mulMul3sample/dropout/dropout/random_uniform/RandomUniform)sample/dropout/dropout/random_uniform/sub*
T0*(
_output_shapes
:??????????
?
%sample/dropout/dropout/random_uniformAdd)sample/dropout/dropout/random_uniform/mul)sample/dropout/dropout/random_uniform/min*
T0*(
_output_shapes
:??????????
?
sample/dropout/dropout/addAdd sample/dropout/dropout/keep_prob%sample/dropout/dropout/random_uniform*
T0*(
_output_shapes
:??????????
t
sample/dropout/dropout/FloorFloorsample/dropout/dropout/add*
T0*(
_output_shapes
:??????????
?
sample/dropout/dropout/divRealDivmodel/layer4/dense1/Relu sample/dropout/dropout/keep_prob*
T0*(
_output_shapes
:??????????
?
sample/dropout/dropout/mulMulsample/dropout/dropout/divsample/dropout/dropout/Floor*(
_output_shapes
:??????????*
T0
q
sample/dropout_summary/tagConst*'
valueB Bsample/dropout_summary*
dtype0*
_output_shapes
: 
s
2sample/dropout_summary/serialized_summary_metadataConst*
valueB B *
dtype0*
_output_shapes
: 
?
sample/dropout_summaryTensorSummaryV2sample/dropout_summary/tagsample/dropout/dropout/mul2sample/dropout_summary/serialized_summary_metadata*
T0*
_output_shapes
: 
?
5sample/logits/kernel/Initializer/random_uniform/shapeConst*'
_class
loc:@sample/logits/kernel*
valueB"?      *
dtype0*
_output_shapes
:
?
3sample/logits/kernel/Initializer/random_uniform/minConst*'
_class
loc:@sample/logits/kernel*
valueB
 *??[?*
dtype0*
_output_shapes
: 
?
3sample/logits/kernel/Initializer/random_uniform/maxConst*'
_class
loc:@sample/logits/kernel*
valueB
 *??[>*
dtype0*
_output_shapes
: 
?
=sample/logits/kernel/Initializer/random_uniform/RandomUniformRandomUniform5sample/logits/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes
:	?*

seed *
T0*'
_class
loc:@sample/logits/kernel*
seed2 
?
3sample/logits/kernel/Initializer/random_uniform/subSub3sample/logits/kernel/Initializer/random_uniform/max3sample/logits/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*'
_class
loc:@sample/logits/kernel
?
3sample/logits/kernel/Initializer/random_uniform/mulMul=sample/logits/kernel/Initializer/random_uniform/RandomUniform3sample/logits/kernel/Initializer/random_uniform/sub*
_output_shapes
:	?*
T0*'
_class
loc:@sample/logits/kernel
?
/sample/logits/kernel/Initializer/random_uniformAdd3sample/logits/kernel/Initializer/random_uniform/mul3sample/logits/kernel/Initializer/random_uniform/min*
T0*'
_class
loc:@sample/logits/kernel*
_output_shapes
:	?
?
sample/logits/kernel
VariableV2*
shared_name *'
_class
loc:@sample/logits/kernel*
	container *
shape:	?*
dtype0*
_output_shapes
:	?
?
sample/logits/kernel/AssignAssignsample/logits/kernel/sample/logits/kernel/Initializer/random_uniform*
validate_shape(*
_output_shapes
:	?*
use_locking(*
T0*'
_class
loc:@sample/logits/kernel
?
sample/logits/kernel/readIdentitysample/logits/kernel*
_output_shapes
:	?*
T0*'
_class
loc:@sample/logits/kernel
?
$sample/logits/bias/Initializer/zerosConst*%
_class
loc:@sample/logits/bias*
valueB*    *
dtype0*
_output_shapes
:
?
sample/logits/bias
VariableV2*
shared_name *%
_class
loc:@sample/logits/bias*
	container *
shape:*
dtype0*
_output_shapes
:
?
sample/logits/bias/AssignAssignsample/logits/bias$sample/logits/bias/Initializer/zeros*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*%
_class
loc:@sample/logits/bias
?
sample/logits/bias/readIdentitysample/logits/bias*
T0*%
_class
loc:@sample/logits/bias*
_output_shapes
:
?
sample/logits/MatMulMatMulsample/dropout/dropout/mulsample/logits/kernel/read*
T0*'
_output_shapes
:?????????*
transpose_a( *
transpose_b( 
?
sample/logits/BiasAddBiasAddsample/logits/MatMulsample/logits/bias/read*
data_formatNHWC*'
_output_shapes
:?????????*
T0
k
sample/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
m
sample/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
m
sample/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
sample/strided_sliceStridedSlicesample/logits/BiasAddsample/strided_slice/stacksample/strided_slice/stack_1sample/strided_slice/stack_2*
end_mask*#
_output_shapes
:?????????*
T0*
Index0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask 
k
sample/logits_false/tagConst*
dtype0*
_output_shapes
: *$
valueB Bsample/logits_false
w
sample/logits_falseHistogramSummarysample/logits_false/tagsample/strided_slice*
T0*
_output_shapes
: 
m
sample/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"       
o
sample/strided_slice_1/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
o
sample/strided_slice_1/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
sample/strided_slice_1StridedSlicesample/logits/BiasAddsample/strided_slice_1/stacksample/strided_slice_1/stack_1sample/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
T0*
Index0
i
sample/logits_true/tagConst*
dtype0*
_output_shapes
: *#
valueB Bsample/logits_true
w
sample/logits_trueHistogramSummarysample/logits_true/tagsample/strided_slice_1*
T0*
_output_shapes
: 
b
sample/softmaxSoftmaxsample/logits/BiasAdd*
T0*'
_output_shapes
:?????????
m
sample/strided_slice_2/stackConst*
valueB"       *
dtype0*
_output_shapes
:
o
sample/strided_slice_2/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
o
sample/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
?
sample/strided_slice_2StridedSlicesample/softmaxsample/strided_slice_2/stacksample/strided_slice_2/stack_1sample/strided_slice_2/stack_2*
end_mask*#
_output_shapes
:?????????*
T0*
Index0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask 
w
sample/softmax_true_score/tagConst**
value!B Bsample/softmax_true_score*
dtype0*
_output_shapes
: 
?
sample/softmax_true_scoreHistogramSummarysample/softmax_true_score/tagsample/strided_slice_2*
T0*
_output_shapes
: 
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
?
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_7f67720efeb14534a46b8cd479b54e84/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
?
save/SaveV2/tensor_namesConst"/device:CPU:0*?
value?B?Bbatch_normalization/betaBbatch_normalization/gammaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaBbatch_normalization_1/gammaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_varianceBbatch_normalization_2/betaBbatch_normalization_2/gammaB!batch_normalization_2/moving_meanB%batch_normalization_2/moving_varianceBglobal_stepBmodel/layer1/conv1/biasBmodel/layer1/conv1/kernelBmodel/layer2/conv2/biasBmodel/layer2/conv2/kernelBmodel/layer3/conv3/biasBmodel/layer3/conv3/kernelBmodel/layer4/dense1/biasBmodel/layer4/dense1/kernelBsample/logits/biasBsample/logits/kernel*
dtype0*
_output_shapes
:
?
save/SaveV2/shape_and_slicesConst"/device:CPU:0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
?
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbatch_normalization/betabatch_normalization/gammabatch_normalization/moving_mean#batch_normalization/moving_variancebatch_normalization_1/betabatch_normalization_1/gamma!batch_normalization_1/moving_mean%batch_normalization_1/moving_variancebatch_normalization_2/betabatch_normalization_2/gamma!batch_normalization_2/moving_mean%batch_normalization_2/moving_varianceglobal_stepmodel/layer1/conv1/biasmodel/layer1/conv1/kernelmodel/layer2/conv2/biasmodel/layer2/conv2/kernelmodel/layer3/conv3/biasmodel/layer3/conv3/kernelmodel/layer4/dense1/biasmodel/layer4/dense1/kernelsample/logits/biassample/logits/kernel"/device:CPU:0*%
dtypes
2	
?
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
?
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
N*
_output_shapes
:*
T0*

axis 
?
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
?
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
?
save/RestoreV2/tensor_namesConst"/device:CPU:0*?
value?B?Bbatch_normalization/betaBbatch_normalization/gammaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaBbatch_normalization_1/gammaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_varianceBbatch_normalization_2/betaBbatch_normalization_2/gammaB!batch_normalization_2/moving_meanB%batch_normalization_2/moving_varianceBglobal_stepBmodel/layer1/conv1/biasBmodel/layer1/conv1/kernelBmodel/layer2/conv2/biasBmodel/layer2/conv2/kernelBmodel/layer3/conv3/biasBmodel/layer3/conv3/kernelBmodel/layer4/dense1/biasBmodel/layer4/dense1/kernelBsample/logits/biasBsample/logits/kernel*
dtype0*
_output_shapes
:
?
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
?
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*p
_output_shapes^
\:::::::::::::::::::::::*%
dtypes
2	
?
save/AssignAssignbatch_normalization/betasave/RestoreV2*
use_locking(*
T0*+
_class!
loc:@batch_normalization/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_1Assignbatch_normalization/gammasave/RestoreV2:1*
use_locking(*
T0*,
_class"
 loc:@batch_normalization/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_2Assignbatch_normalization/moving_meansave/RestoreV2:2*
use_locking(*
T0*2
_class(
&$loc:@batch_normalization/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_3Assign#batch_normalization/moving_variancesave/RestoreV2:3*
T0*6
_class,
*(loc:@batch_normalization/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_4Assignbatch_normalization_1/betasave/RestoreV2:4*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_1/beta*
validate_shape(*
_output_shapes
:@
?
save/Assign_5Assignbatch_normalization_1/gammasave/RestoreV2:5*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_1/gamma*
validate_shape(*
_output_shapes
:@
?
save/Assign_6Assign!batch_normalization_1/moving_meansave/RestoreV2:6*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean*
validate_shape(*
_output_shapes
:@
?
save/Assign_7Assign%batch_normalization_1/moving_variancesave/RestoreV2:7*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
validate_shape(*
_output_shapes
:@*
use_locking(
?
save/Assign_8Assignbatch_normalization_2/betasave/RestoreV2:8*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_2/beta
?
save/Assign_9Assignbatch_normalization_2/gammasave/RestoreV2:9*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_2/gamma
?
save/Assign_10Assign!batch_normalization_2/moving_meansave/RestoreV2:10*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean
?
save/Assign_11Assign%batch_normalization_2/moving_variancesave/RestoreV2:11*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
validate_shape(*
_output_shapes
:@
?
save/Assign_12Assignglobal_stepsave/RestoreV2:12*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
?
save/Assign_13Assignmodel/layer1/conv1/biassave/RestoreV2:13*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0**
_class 
loc:@model/layer1/conv1/bias
?
save/Assign_14Assignmodel/layer1/conv1/kernelsave/RestoreV2:14*
use_locking(*
T0*,
_class"
 loc:@model/layer1/conv1/kernel*
validate_shape(*'
_output_shapes
:?
?
save/Assign_15Assignmodel/layer2/conv2/biassave/RestoreV2:15*
use_locking(*
T0**
_class 
loc:@model/layer2/conv2/bias*
validate_shape(*
_output_shapes
:@
?
save/Assign_16Assignmodel/layer2/conv2/kernelsave/RestoreV2:16*
use_locking(*
T0*,
_class"
 loc:@model/layer2/conv2/kernel*
validate_shape(*'
_output_shapes
:?@
?
save/Assign_17Assignmodel/layer3/conv3/biassave/RestoreV2:17*
use_locking(*
T0**
_class 
loc:@model/layer3/conv3/bias*
validate_shape(*
_output_shapes
:@
?
save/Assign_18Assignmodel/layer3/conv3/kernelsave/RestoreV2:18*
use_locking(*
T0*,
_class"
 loc:@model/layer3/conv3/kernel*
validate_shape(*&
_output_shapes
:@@
?
save/Assign_19Assignmodel/layer4/dense1/biassave/RestoreV2:19*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@model/layer4/dense1/bias
?
save/Assign_20Assignmodel/layer4/dense1/kernelsave/RestoreV2:20*
use_locking(*
T0*-
_class#
!loc:@model/layer4/dense1/kernel*
validate_shape(* 
_output_shapes
:
? ?
?
save/Assign_21Assignsample/logits/biassave/RestoreV2:21*
T0*%
_class
loc:@sample/logits/bias*
validate_shape(*
_output_shapes
:*
use_locking(
?
save/Assign_22Assignsample/logits/kernelsave/RestoreV2:22*
use_locking(*
T0*'
_class
loc:@sample/logits/kernel*
validate_shape(*
_output_shapes
:	?
?
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
-
save/restore_allNoOp^save/restore_shard

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
?
save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_bdddccc8b59943c9bfa739c8aa853b05/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
?
save_1/SaveV2/tensor_namesConst"/device:CPU:0*?
value?B?Bbatch_normalization/betaBbatch_normalization/gammaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaBbatch_normalization_1/gammaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_varianceBbatch_normalization_2/betaBbatch_normalization_2/gammaB!batch_normalization_2/moving_meanB%batch_normalization_2/moving_varianceBglobal_stepBmodel/layer1/conv1/biasBmodel/layer1/conv1/kernelBmodel/layer2/conv2/biasBmodel/layer2/conv2/kernelBmodel/layer3/conv3/biasBmodel/layer3/conv3/kernelBmodel/layer4/dense1/biasBmodel/layer4/dense1/kernelBsample/logits/biasBsample/logits/kernel*
dtype0*
_output_shapes
:
?
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
?
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesbatch_normalization/betabatch_normalization/gammabatch_normalization/moving_mean#batch_normalization/moving_variancebatch_normalization_1/betabatch_normalization_1/gamma!batch_normalization_1/moving_mean%batch_normalization_1/moving_variancebatch_normalization_2/betabatch_normalization_2/gamma!batch_normalization_2/moving_mean%batch_normalization_2/moving_varianceglobal_stepmodel/layer1/conv1/biasmodel/layer1/conv1/kernelmodel/layer2/conv2/biasmodel/layer2/conv2/kernelmodel/layer3/conv3/biasmodel/layer3/conv3/kernelmodel/layer4/dense1/biasmodel/layer4/dense1/kernelsample/logits/biassample/logits/kernel"/device:CPU:0*%
dtypes
2	
?
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
_output_shapes
: *
T0*)
_class
loc:@save_1/ShardedFilename
?
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
?
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(
?
save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
?
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*?
value?B?Bbatch_normalization/betaBbatch_normalization/gammaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaBbatch_normalization_1/gammaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_varianceBbatch_normalization_2/betaBbatch_normalization_2/gammaB!batch_normalization_2/moving_meanB%batch_normalization_2/moving_varianceBglobal_stepBmodel/layer1/conv1/biasBmodel/layer1/conv1/kernelBmodel/layer2/conv2/biasBmodel/layer2/conv2/kernelBmodel/layer3/conv3/biasBmodel/layer3/conv3/kernelBmodel/layer4/dense1/biasBmodel/layer4/dense1/kernelBsample/logits/biasBsample/logits/kernel*
dtype0*
_output_shapes
:
?
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
?
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*%
dtypes
2	*p
_output_shapes^
\:::::::::::::::::::::::
?
save_1/AssignAssignbatch_normalization/betasave_1/RestoreV2*
T0*+
_class!
loc:@batch_normalization/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save_1/Assign_1Assignbatch_normalization/gammasave_1/RestoreV2:1*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*,
_class"
 loc:@batch_normalization/gamma
?
save_1/Assign_2Assignbatch_normalization/moving_meansave_1/RestoreV2:2*
T0*2
_class(
&$loc:@batch_normalization/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save_1/Assign_3Assign#batch_normalization/moving_variancesave_1/RestoreV2:3*
T0*6
_class,
*(loc:@batch_normalization/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save_1/Assign_4Assignbatch_normalization_1/betasave_1/RestoreV2:4*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*-
_class#
!loc:@batch_normalization_1/beta
?
save_1/Assign_5Assignbatch_normalization_1/gammasave_1/RestoreV2:5*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_1/gamma*
validate_shape(*
_output_shapes
:@
?
save_1/Assign_6Assign!batch_normalization_1/moving_meansave_1/RestoreV2:6*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean
?
save_1/Assign_7Assign%batch_normalization_1/moving_variancesave_1/RestoreV2:7*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
validate_shape(*
_output_shapes
:@
?
save_1/Assign_8Assignbatch_normalization_2/betasave_1/RestoreV2:8*
T0*-
_class#
!loc:@batch_normalization_2/beta*
validate_shape(*
_output_shapes
:@*
use_locking(
?
save_1/Assign_9Assignbatch_normalization_2/gammasave_1/RestoreV2:9*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*.
_class$
" loc:@batch_normalization_2/gamma
?
save_1/Assign_10Assign!batch_normalization_2/moving_meansave_1/RestoreV2:10*
use_locking(*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
validate_shape(*
_output_shapes
:@
?
save_1/Assign_11Assign%batch_normalization_2/moving_variancesave_1/RestoreV2:11*
use_locking(*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
validate_shape(*
_output_shapes
:@
?
save_1/Assign_12Assignglobal_stepsave_1/RestoreV2:12*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: *
use_locking(
?
save_1/Assign_13Assignmodel/layer1/conv1/biassave_1/RestoreV2:13*
use_locking(*
T0**
_class 
loc:@model/layer1/conv1/bias*
validate_shape(*
_output_shapes	
:?
?
save_1/Assign_14Assignmodel/layer1/conv1/kernelsave_1/RestoreV2:14*
validate_shape(*'
_output_shapes
:?*
use_locking(*
T0*,
_class"
 loc:@model/layer1/conv1/kernel
?
save_1/Assign_15Assignmodel/layer2/conv2/biassave_1/RestoreV2:15*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0**
_class 
loc:@model/layer2/conv2/bias
?
save_1/Assign_16Assignmodel/layer2/conv2/kernelsave_1/RestoreV2:16*
use_locking(*
T0*,
_class"
 loc:@model/layer2/conv2/kernel*
validate_shape(*'
_output_shapes
:?@
?
save_1/Assign_17Assignmodel/layer3/conv3/biassave_1/RestoreV2:17*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0**
_class 
loc:@model/layer3/conv3/bias
?
save_1/Assign_18Assignmodel/layer3/conv3/kernelsave_1/RestoreV2:18*
T0*,
_class"
 loc:@model/layer3/conv3/kernel*
validate_shape(*&
_output_shapes
:@@*
use_locking(
?
save_1/Assign_19Assignmodel/layer4/dense1/biassave_1/RestoreV2:19*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@model/layer4/dense1/bias
?
save_1/Assign_20Assignmodel/layer4/dense1/kernelsave_1/RestoreV2:20*
use_locking(*
T0*-
_class#
!loc:@model/layer4/dense1/kernel*
validate_shape(* 
_output_shapes
:
? ?
?
save_1/Assign_21Assignsample/logits/biassave_1/RestoreV2:21*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*%
_class
loc:@sample/logits/bias
?
save_1/Assign_22Assignsample/logits/kernelsave_1/RestoreV2:22*
validate_shape(*
_output_shapes
:	?*
use_locking(*
T0*'
_class
loc:@sample/logits/kernel
?
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_2^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8" 
legacy_init_op


group_deps"k
global_step\Z
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0"?
	summaries?
?
preprocess/b_greyscale:0
preprocess/c_augmented:0
model_input:0
sample/dropout_summary:0
sample/logits_false:0
sample/logits_true:0
sample/softmax_true_score:0"?
trainable_variables??
?
model/layer1/conv1/kernel:0 model/layer1/conv1/kernel/Assign model/layer1/conv1/kernel/read:026model/layer1/conv1/kernel/Initializer/random_uniform:0
?
model/layer1/conv1/bias:0model/layer1/conv1/bias/Assignmodel/layer1/conv1/bias/read:02+model/layer1/conv1/bias/Initializer/zeros:0
?
batch_normalization/gamma:0 batch_normalization/gamma/Assign batch_normalization/gamma/read:02,batch_normalization/gamma/Initializer/ones:0
?
batch_normalization/beta:0batch_normalization/beta/Assignbatch_normalization/beta/read:02,batch_normalization/beta/Initializer/zeros:0
?
model/layer2/conv2/kernel:0 model/layer2/conv2/kernel/Assign model/layer2/conv2/kernel/read:026model/layer2/conv2/kernel/Initializer/random_uniform:0
?
model/layer2/conv2/bias:0model/layer2/conv2/bias/Assignmodel/layer2/conv2/bias/read:02+model/layer2/conv2/bias/Initializer/zeros:0
?
batch_normalization_1/gamma:0"batch_normalization_1/gamma/Assign"batch_normalization_1/gamma/read:02.batch_normalization_1/gamma/Initializer/ones:0
?
batch_normalization_1/beta:0!batch_normalization_1/beta/Assign!batch_normalization_1/beta/read:02.batch_normalization_1/beta/Initializer/zeros:0
?
model/layer3/conv3/kernel:0 model/layer3/conv3/kernel/Assign model/layer3/conv3/kernel/read:026model/layer3/conv3/kernel/Initializer/random_uniform:0
?
model/layer3/conv3/bias:0model/layer3/conv3/bias/Assignmodel/layer3/conv3/bias/read:02+model/layer3/conv3/bias/Initializer/zeros:0
?
batch_normalization_2/gamma:0"batch_normalization_2/gamma/Assign"batch_normalization_2/gamma/read:02.batch_normalization_2/gamma/Initializer/ones:0
?
batch_normalization_2/beta:0!batch_normalization_2/beta/Assign!batch_normalization_2/beta/read:02.batch_normalization_2/beta/Initializer/zeros:0
?
model/layer4/dense1/kernel:0!model/layer4/dense1/kernel/Assign!model/layer4/dense1/kernel/read:027model/layer4/dense1/kernel/Initializer/random_uniform:0
?
model/layer4/dense1/bias:0model/layer4/dense1/bias/Assignmodel/layer4/dense1/bias/read:02,model/layer4/dense1/bias/Initializer/zeros:0
?
sample/logits/kernel:0sample/logits/kernel/Assignsample/logits/kernel/read:021sample/logits/kernel/Initializer/random_uniform:0
t
sample/logits/bias:0sample/logits/bias/Assignsample/logits/bias/read:02&sample/logits/bias/Initializer/zeros:0"?
	variables??
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
?
model/layer1/conv1/kernel:0 model/layer1/conv1/kernel/Assign model/layer1/conv1/kernel/read:026model/layer1/conv1/kernel/Initializer/random_uniform:0
?
model/layer1/conv1/bias:0model/layer1/conv1/bias/Assignmodel/layer1/conv1/bias/read:02+model/layer1/conv1/bias/Initializer/zeros:0
?
batch_normalization/gamma:0 batch_normalization/gamma/Assign batch_normalization/gamma/read:02,batch_normalization/gamma/Initializer/ones:0
?
batch_normalization/beta:0batch_normalization/beta/Assignbatch_normalization/beta/read:02,batch_normalization/beta/Initializer/zeros:0
?
!batch_normalization/moving_mean:0&batch_normalization/moving_mean/Assign&batch_normalization/moving_mean/read:023batch_normalization/moving_mean/Initializer/zeros:0
?
%batch_normalization/moving_variance:0*batch_normalization/moving_variance/Assign*batch_normalization/moving_variance/read:026batch_normalization/moving_variance/Initializer/ones:0
?
model/layer2/conv2/kernel:0 model/layer2/conv2/kernel/Assign model/layer2/conv2/kernel/read:026model/layer2/conv2/kernel/Initializer/random_uniform:0
?
model/layer2/conv2/bias:0model/layer2/conv2/bias/Assignmodel/layer2/conv2/bias/read:02+model/layer2/conv2/bias/Initializer/zeros:0
?
batch_normalization_1/gamma:0"batch_normalization_1/gamma/Assign"batch_normalization_1/gamma/read:02.batch_normalization_1/gamma/Initializer/ones:0
?
batch_normalization_1/beta:0!batch_normalization_1/beta/Assign!batch_normalization_1/beta/read:02.batch_normalization_1/beta/Initializer/zeros:0
?
#batch_normalization_1/moving_mean:0(batch_normalization_1/moving_mean/Assign(batch_normalization_1/moving_mean/read:025batch_normalization_1/moving_mean/Initializer/zeros:0
?
'batch_normalization_1/moving_variance:0,batch_normalization_1/moving_variance/Assign,batch_normalization_1/moving_variance/read:028batch_normalization_1/moving_variance/Initializer/ones:0
?
model/layer3/conv3/kernel:0 model/layer3/conv3/kernel/Assign model/layer3/conv3/kernel/read:026model/layer3/conv3/kernel/Initializer/random_uniform:0
?
model/layer3/conv3/bias:0model/layer3/conv3/bias/Assignmodel/layer3/conv3/bias/read:02+model/layer3/conv3/bias/Initializer/zeros:0
?
batch_normalization_2/gamma:0"batch_normalization_2/gamma/Assign"batch_normalization_2/gamma/read:02.batch_normalization_2/gamma/Initializer/ones:0
?
batch_normalization_2/beta:0!batch_normalization_2/beta/Assign!batch_normalization_2/beta/read:02.batch_normalization_2/beta/Initializer/zeros:0
?
#batch_normalization_2/moving_mean:0(batch_normalization_2/moving_mean/Assign(batch_normalization_2/moving_mean/read:025batch_normalization_2/moving_mean/Initializer/zeros:0
?
'batch_normalization_2/moving_variance:0,batch_normalization_2/moving_variance/Assign,batch_normalization_2/moving_variance/read:028batch_normalization_2/moving_variance/Initializer/ones:0
?
model/layer4/dense1/kernel:0!model/layer4/dense1/kernel/Assign!model/layer4/dense1/kernel/read:027model/layer4/dense1/kernel/Initializer/random_uniform:0
?
model/layer4/dense1/bias:0model/layer4/dense1/bias/Assignmodel/layer4/dense1/bias/read:02,model/layer4/dense1/bias/Initializer/zeros:0
?
sample/logits/kernel:0sample/logits/kernel/Assignsample/logits/kernel/read:021sample/logits/kernel/Initializer/random_uniform:0
t
sample/logits/bias:0sample/logits/bias/Assignsample/logits/bias/read:02&sample/logits/bias/Initializer/zeros:0"??
while_context????
?$
"preprocess/map/while/while_context
*preprocess/map/while/LoopCond:02preprocess/map/while/Merge:0:preprocess/map/while/Identity:0Bpreprocess/map/while/Exit:0Bpreprocess/map/while/Exit_1:0J?
preprocess/map/TensorArray:0
Kpreprocess/map/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
preprocess/map/TensorArray_1:0
preprocess/map/strided_slice:0
preprocess/map/while/Enter:0
preprocess/map/while/Enter_1:0
preprocess/map/while/Exit:0
preprocess/map/while/Exit_1:0
preprocess/map/while/Identity:0
!preprocess/map/while/Identity_1:0
!preprocess/map/while/Less/Enter:0
preprocess/map/while/Less:0
preprocess/map/while/LoopCond:0
preprocess/map/while/Merge:0
preprocess/map/while/Merge:1
preprocess/map/while/Merge_1:0
preprocess/map/while/Merge_1:1
$preprocess/map/while/NextIteration:0
&preprocess/map/while/NextIteration_1:0
preprocess/map/while/Switch:0
preprocess/map/while/Switch:1
preprocess/map/while/Switch_1:0
preprocess/map/while/Switch_1:1
.preprocess/map/while/TensorArrayReadV3/Enter:0
0preprocess/map/while/TensorArrayReadV3/Enter_1:0
(preprocess/map/while/TensorArrayReadV3:0
@preprocess/map/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
:preprocess/map/while/TensorArrayWrite/TensorArrayWriteV3:0
preprocess/map/while/add/y:0
preprocess/map/while/add:0
4preprocess/map/while/random_flip_left_right/Less/y:0
2preprocess/map/while/random_flip_left_right/Less:0
3preprocess/map/while/random_flip_left_right/Merge:0
3preprocess/map/while/random_flip_left_right/Merge:1
<preprocess/map/while/random_flip_left_right/ReverseV2/axis:0
7preprocess/map/while/random_flip_left_right/ReverseV2:0
4preprocess/map/while/random_flip_left_right/Switch:0
4preprocess/map/while/random_flip_left_right/Switch:1
6preprocess/map/while/random_flip_left_right/Switch_1:0
6preprocess/map/while/random_flip_left_right/Switch_1:1
@preprocess/map/while/random_flip_left_right/control_dependency:0
5preprocess/map/while/random_flip_left_right/pred_id:0
Jpreprocess/map/while/random_flip_left_right/random_uniform/RandomUniform:0
@preprocess/map/while/random_flip_left_right/random_uniform/max:0
@preprocess/map/while/random_flip_left_right/random_uniform/min:0
@preprocess/map/while/random_flip_left_right/random_uniform/mul:0
Bpreprocess/map/while/random_flip_left_right/random_uniform/shape:0
@preprocess/map/while/random_flip_left_right/random_uniform/sub:0
<preprocess/map/while/random_flip_left_right/random_uniform:0
6preprocess/map/while/random_flip_left_right/switch_f:0
6preprocess/map/while/random_flip_left_right/switch_t:0b
preprocess/map/TensorArray_1:0@preprocess/map/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
Kpreprocess/map/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:00preprocess/map/while/TensorArrayReadV3/Enter_1:0N
preprocess/map/TensorArray:0.preprocess/map/while/TensorArrayReadV3/Enter:0C
preprocess/map/strided_slice:0!preprocess/map/while/Less/Enter:0Rpreprocess/map/while/Enter:0Rpreprocess/map/while/Enter_1:0b?
?
5preprocess/map/while/random_flip_left_right/cond_text5preprocess/map/while/random_flip_left_right/pred_id:06preprocess/map/while/random_flip_left_right/switch_t:0 *?
>preprocess/map/while/random_flip_left_right/ReverseV2/Switch:1
<preprocess/map/while/random_flip_left_right/ReverseV2/axis:0
7preprocess/map/while/random_flip_left_right/ReverseV2:0
@preprocess/map/while/random_flip_left_right/control_dependency:0
5preprocess/map/while/random_flip_left_right/pred_id:0
6preprocess/map/while/random_flip_left_right/switch_t:0n
5preprocess/map/while/random_flip_left_right/pred_id:05preprocess/map/while/random_flip_left_right/pred_id:0?
@preprocess/map/while/random_flip_left_right/control_dependency:0>preprocess/map/while/random_flip_left_right/ReverseV2/Switch:1p
6preprocess/map/while/random_flip_left_right/switch_t:06preprocess/map/while/random_flip_left_right/switch_t:0b?
?
7preprocess/map/while/random_flip_left_right/cond_text_15preprocess/map/while/random_flip_left_right/pred_id:06preprocess/map/while/random_flip_left_right/switch_f:0*?
6preprocess/map/while/random_flip_left_right/Switch_1:0
6preprocess/map/while/random_flip_left_right/Switch_1:1
@preprocess/map/while/random_flip_left_right/control_dependency:0
5preprocess/map/while/random_flip_left_right/pred_id:0
6preprocess/map/while/random_flip_left_right/switch_f:0z
@preprocess/map/while/random_flip_left_right/control_dependency:06preprocess/map/while/random_flip_left_right/Switch_1:0p
6preprocess/map/while/random_flip_left_right/switch_f:06preprocess/map/while/random_flip_left_right/switch_f:0n
5preprocess/map/while/random_flip_left_right/pred_id:05preprocess/map/while/random_flip_left_right/pred_id:0
?%
$preprocess/map_1/while/while_context
*!preprocess/map_1/while/LoopCond:02preprocess/map_1/while/Merge:0:!preprocess/map_1/while/Identity:0Bpreprocess/map_1/while/Exit:0Bpreprocess/map_1/while/Exit_1:0J?
preprocess/map_1/TensorArray:0
Mpreprocess/map_1/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
 preprocess/map_1/TensorArray_1:0
 preprocess/map_1/strided_slice:0
preprocess/map_1/while/Enter:0
 preprocess/map_1/while/Enter_1:0
preprocess/map_1/while/Exit:0
preprocess/map_1/while/Exit_1:0
!preprocess/map_1/while/Identity:0
#preprocess/map_1/while/Identity_1:0
#preprocess/map_1/while/Less/Enter:0
preprocess/map_1/while/Less:0
!preprocess/map_1/while/LoopCond:0
preprocess/map_1/while/Merge:0
preprocess/map_1/while/Merge:1
 preprocess/map_1/while/Merge_1:0
 preprocess/map_1/while/Merge_1:1
&preprocess/map_1/while/NextIteration:0
(preprocess/map_1/while/NextIteration_1:0
preprocess/map_1/while/Switch:0
preprocess/map_1/while/Switch:1
!preprocess/map_1/while/Switch_1:0
!preprocess/map_1/while/Switch_1:1
0preprocess/map_1/while/TensorArrayReadV3/Enter:0
2preprocess/map_1/while/TensorArrayReadV3/Enter_1:0
*preprocess/map_1/while/TensorArrayReadV3:0
Bpreprocess/map_1/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
<preprocess/map_1/while/TensorArrayWrite/TensorArrayWriteV3:0
preprocess/map_1/while/add/y:0
preprocess/map_1/while/add:0
3preprocess/map_1/while/random_flip_up_down/Less/y:0
1preprocess/map_1/while/random_flip_up_down/Less:0
2preprocess/map_1/while/random_flip_up_down/Merge:0
2preprocess/map_1/while/random_flip_up_down/Merge:1
;preprocess/map_1/while/random_flip_up_down/ReverseV2/axis:0
6preprocess/map_1/while/random_flip_up_down/ReverseV2:0
3preprocess/map_1/while/random_flip_up_down/Switch:0
3preprocess/map_1/while/random_flip_up_down/Switch:1
5preprocess/map_1/while/random_flip_up_down/Switch_1:0
5preprocess/map_1/while/random_flip_up_down/Switch_1:1
?preprocess/map_1/while/random_flip_up_down/control_dependency:0
4preprocess/map_1/while/random_flip_up_down/pred_id:0
Ipreprocess/map_1/while/random_flip_up_down/random_uniform/RandomUniform:0
?preprocess/map_1/while/random_flip_up_down/random_uniform/max:0
?preprocess/map_1/while/random_flip_up_down/random_uniform/min:0
?preprocess/map_1/while/random_flip_up_down/random_uniform/mul:0
Apreprocess/map_1/while/random_flip_up_down/random_uniform/shape:0
?preprocess/map_1/while/random_flip_up_down/random_uniform/sub:0
;preprocess/map_1/while/random_flip_up_down/random_uniform:0
5preprocess/map_1/while/random_flip_up_down/switch_f:0
5preprocess/map_1/while/random_flip_up_down/switch_t:0f
 preprocess/map_1/TensorArray_1:0Bpreprocess/map_1/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0?
Mpreprocess/map_1/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:02preprocess/map_1/while/TensorArrayReadV3/Enter_1:0R
preprocess/map_1/TensorArray:00preprocess/map_1/while/TensorArrayReadV3/Enter:0G
 preprocess/map_1/strided_slice:0#preprocess/map_1/while/Less/Enter:0Rpreprocess/map_1/while/Enter:0R preprocess/map_1/while/Enter_1:0b?
?
4preprocess/map_1/while/random_flip_up_down/cond_text4preprocess/map_1/while/random_flip_up_down/pred_id:05preprocess/map_1/while/random_flip_up_down/switch_t:0 *?
=preprocess/map_1/while/random_flip_up_down/ReverseV2/Switch:1
;preprocess/map_1/while/random_flip_up_down/ReverseV2/axis:0
6preprocess/map_1/while/random_flip_up_down/ReverseV2:0
?preprocess/map_1/while/random_flip_up_down/control_dependency:0
4preprocess/map_1/while/random_flip_up_down/pred_id:0
5preprocess/map_1/while/random_flip_up_down/switch_t:0?
?preprocess/map_1/while/random_flip_up_down/control_dependency:0=preprocess/map_1/while/random_flip_up_down/ReverseV2/Switch:1n
5preprocess/map_1/while/random_flip_up_down/switch_t:05preprocess/map_1/while/random_flip_up_down/switch_t:0l
4preprocess/map_1/while/random_flip_up_down/pred_id:04preprocess/map_1/while/random_flip_up_down/pred_id:0b?
?
6preprocess/map_1/while/random_flip_up_down/cond_text_14preprocess/map_1/while/random_flip_up_down/pred_id:05preprocess/map_1/while/random_flip_up_down/switch_f:0*?
5preprocess/map_1/while/random_flip_up_down/Switch_1:0
5preprocess/map_1/while/random_flip_up_down/Switch_1:1
?preprocess/map_1/while/random_flip_up_down/control_dependency:0
4preprocess/map_1/while/random_flip_up_down/pred_id:0
5preprocess/map_1/while/random_flip_up_down/switch_f:0n
5preprocess/map_1/while/random_flip_up_down/switch_f:05preprocess/map_1/while/random_flip_up_down/switch_f:0l
4preprocess/map_1/while/random_flip_up_down/pred_id:04preprocess/map_1/while/random_flip_up_down/pred_id:0x
?preprocess/map_1/while/random_flip_up_down/control_dependency:05preprocess/map_1/while/random_flip_up_down/Switch_1:0
?I
$preprocess/map_2/while/while_context
*!preprocess/map_2/while/LoopCond:02preprocess/map_2/while/Merge:0:!preprocess/map_2/while/Identity:0Bpreprocess/map_2/while/Exit:0Bpreprocess/map_2/while/Exit_1:0J?F
preprocess/map_2/TensorArray:0
Mpreprocess/map_2/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
 preprocess/map_2/TensorArray_1:0
 preprocess/map_2/strided_slice:0
preprocess/map_2/while/Enter:0
 preprocess/map_2/while/Enter_1:0
preprocess/map_2/while/Exit:0
preprocess/map_2/while/Exit_1:0
!preprocess/map_2/while/Identity:0
#preprocess/map_2/while/Identity_1:0
#preprocess/map_2/while/Less/Enter:0
preprocess/map_2/while/Less:0
!preprocess/map_2/while/LoopCond:0
preprocess/map_2/while/Merge:0
preprocess/map_2/while/Merge:1
 preprocess/map_2/while/Merge_1:0
 preprocess/map_2/while/Merge_1:1
&preprocess/map_2/while/NextIteration:0
(preprocess/map_2/while/NextIteration_1:0
preprocess/map_2/while/Switch:0
preprocess/map_2/while/Switch:1
!preprocess/map_2/while/Switch_1:0
!preprocess/map_2/while/Switch_1:1
0preprocess/map_2/while/TensorArrayReadV3/Enter:0
2preprocess/map_2/while/TensorArrayReadV3/Enter_1:0
*preprocess/map_2/while/TensorArrayReadV3:0
Bpreprocess/map_2/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
<preprocess/map_2/while/TensorArrayWrite/TensorArrayWriteV3:0
preprocess/map_2/while/add/y:0
preprocess/map_2/while/add:0
preprocess/map_2/while/mul/x:0
preprocess/map_2/while/mul:0
5preprocess/map_2/while/random_uniform/RandomUniform:0
+preprocess/map_2/while/random_uniform/max:0
+preprocess/map_2/while/random_uniform/min:0
+preprocess/map_2/while/random_uniform/mul:0
-preprocess/map_2/while/random_uniform/shape:0
+preprocess/map_2/while/random_uniform/sub:0
'preprocess/map_2/while/random_uniform:0
$preprocess/map_2/while/rotate/Cast:0
&preprocess/map_2/while/rotate/Cast_1:0
%preprocess/map_2/while/rotate/Shape:0
'preprocess/map_2/while/rotate/Shape_1:0
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_1:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_2:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/Cos_3:0
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Neg:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/Shape:0
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_1:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_2:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/Sin_3:0
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/add:0
Kpreprocess/map_2/while/rotate/angles_to_projective_transforms/concat/axis:0
Fpreprocess/map_2/while/rotate/angles_to_projective_transforms/concat:0
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/mul:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_1:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_2:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/mul_3:0
Spreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stack:0
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stack_1:0
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice/stack_2:0
Mpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice:0
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stack:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stack_1:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1/stack_2:0
Opreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_1:0
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stack:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stack_1:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2/stack_2:0
Opreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_2:0
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stack:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stack_1:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3/stack_2:0
Opreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_3:0
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stack:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stack_1:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4/stack_2:0
Opreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_4:0
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stack:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stack_1:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5/stack_2:0
Opreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_5:0
Upreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stack:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stack_1:0
Wpreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6/stack_2:0
Opreprocess/map_2/while/rotate/angles_to_projective_transforms/strided_slice_6:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub/y:0
Cpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub:0
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_1/y:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_1:0
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_2/y:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_2:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_3:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_4:0
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_5/y:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_5:0
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_6/y:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_6:0
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_7/y:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_7:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/sub_8:0
Ipreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv/y:0
Gpreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv:0
Kpreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv_1/y:0
Ipreprocess/map_2/while/rotate/angles_to_projective_transforms/truediv_1:0
Kpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/Const:0
Lpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/Less/y:0
Jpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/Less:0
Kpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/mul/y:0
Ipreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/mul:0
Npreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/packed/1:0
Lpreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros/packed:0
Epreprocess/map_2/while/rotate/angles_to_projective_transforms/zeros:0
3preprocess/map_2/while/rotate/strided_slice/stack:0
5preprocess/map_2/while/rotate/strided_slice/stack_1:0
5preprocess/map_2/while/rotate/strided_slice/stack_2:0
-preprocess/map_2/while/rotate/strided_slice:0
5preprocess/map_2/while/rotate/strided_slice_1/stack:0
7preprocess/map_2/while/rotate/strided_slice_1/stack_1:0
7preprocess/map_2/while/rotate/strided_slice_1/stack_2:0
/preprocess/map_2/while/rotate/strided_slice_1:0
5preprocess/map_2/while/rotate/strided_slice_2/stack:0
7preprocess/map_2/while/rotate/strided_slice_2/stack_1:0
7preprocess/map_2/while/rotate/strided_slice_2/stack_2:0
/preprocess/map_2/while/rotate/strided_slice_2:0
5preprocess/map_2/while/rotate/strided_slice_3/stack:0
7preprocess/map_2/while/rotate/strided_slice_3/stack_1:0
7preprocess/map_2/while/rotate/strided_slice_3/stack_2:0
/preprocess/map_2/while/rotate/strided_slice_3:0
5preprocess/map_2/while/rotate/strided_slice_4/stack:0
7preprocess/map_2/while/rotate/strided_slice_4/stack_1:0
7preprocess/map_2/while/rotate/strided_slice_4/stack_2:0
/preprocess/map_2/while/rotate/strided_slice_4:0
5preprocess/map_2/while/rotate/strided_slice_5/stack:0
7preprocess/map_2/while/rotate/strided_slice_5/stack_1:0
7preprocess/map_2/while/rotate/strided_slice_5/stack_2:0
/preprocess/map_2/while/rotate/strided_slice_5:0
Bpreprocess/map_2/while/rotate/transform/ImageProjectiveTransform:0R
preprocess/map_2/TensorArray:00preprocess/map_2/while/TensorArrayReadV3/Enter:0G
 preprocess/map_2/strided_slice:0#preprocess/map_2/while/Less/Enter:0f
 preprocess/map_2/TensorArray_1:0Bpreprocess/map_2/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0?
Mpreprocess/map_2/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:02preprocess/map_2/while/TensorArrayReadV3/Enter_1:0Rpreprocess/map_2/while/Enter:0R preprocess/map_2/while/Enter_1:0
?
$preprocess/map_3/while/while_context
*!preprocess/map_3/while/LoopCond:02preprocess/map_3/while/Merge:0:!preprocess/map_3/while/Identity:0Bpreprocess/map_3/while/Exit:0Bpreprocess/map_3/while/Exit_1:0J?
preprocess/map_3/TensorArray:0
Mpreprocess/map_3/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
 preprocess/map_3/TensorArray_1:0
 preprocess/map_3/strided_slice:0
preprocess/map_3/while/Const:0
preprocess/map_3/while/Enter:0
 preprocess/map_3/while/Enter_1:0
preprocess/map_3/while/Exit:0
preprocess/map_3/while/Exit_1:0
!preprocess/map_3/while/Identity:0
#preprocess/map_3/while/Identity_1:0
#preprocess/map_3/while/Less/Enter:0
preprocess/map_3/while/Less:0
!preprocess/map_3/while/LoopCond:0
preprocess/map_3/while/Merge:0
preprocess/map_3/while/Merge:1
 preprocess/map_3/while/Merge_1:0
 preprocess/map_3/while/Merge_1:1
&preprocess/map_3/while/NextIteration:0
(preprocess/map_3/while/NextIteration_1:0
preprocess/map_3/while/Switch:0
preprocess/map_3/while/Switch:1
!preprocess/map_3/while/Switch_1:0
!preprocess/map_3/while/Switch_1:1
0preprocess/map_3/while/TensorArrayReadV3/Enter:0
2preprocess/map_3/while/TensorArrayReadV3/Enter_1:0
*preprocess/map_3/while/TensorArrayReadV3:0
Bpreprocess/map_3/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
<preprocess/map_3/while/TensorArrayWrite/TensorArrayWriteV3:0
preprocess/map_3/while/add/y:0
preprocess/map_3/while/add:0
(preprocess/map_3/while/random_crop/All:0
9preprocess/map_3/while/random_crop/Assert/Assert/data_0:0
1preprocess/map_3/while/random_crop/Assert/Const:0
*preprocess/map_3/while/random_crop/Const:0
1preprocess/map_3/while/random_crop/GreaterEqual:0
*preprocess/map_3/while/random_crop/Shape:0
,preprocess/map_3/while/random_crop/Shape_1:0
*preprocess/map_3/while/random_crop/add/y:0
(preprocess/map_3/while/random_crop/add:0
7preprocess/map_3/while/random_crop/control_dependency:0
(preprocess/map_3/while/random_crop/mod:0
7preprocess/map_3/while/random_crop/random_uniform/max:0
7preprocess/map_3/while/random_crop/random_uniform/min:0
3preprocess/map_3/while/random_crop/random_uniform:0
(preprocess/map_3/while/random_crop/sub:0
$preprocess/map_3/while/random_crop:0?
Mpreprocess/map_3/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:02preprocess/map_3/while/TensorArrayReadV3/Enter_1:0R
preprocess/map_3/TensorArray:00preprocess/map_3/while/TensorArrayReadV3/Enter:0G
 preprocess/map_3/strided_slice:0#preprocess/map_3/while/Less/Enter:0f
 preprocess/map_3/TensorArray_1:0Bpreprocess/map_3/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0Rpreprocess/map_3/while/Enter:0R preprocess/map_3/while/Enter_1:0
?
$preprocess/map_4/while/while_context
*!preprocess/map_4/while/LoopCond:02preprocess/map_4/while/Merge:0:!preprocess/map_4/while/Identity:0Bpreprocess/map_4/while/Exit:0Bpreprocess/map_4/while/Exit_1:0J?
preprocess/map_4/TensorArray:0
Mpreprocess/map_4/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
 preprocess/map_4/TensorArray_1:0
 preprocess/map_4/strided_slice:0
preprocess/map_4/while/Enter:0
 preprocess/map_4/while/Enter_1:0
preprocess/map_4/while/Exit:0
preprocess/map_4/while/Exit_1:0
!preprocess/map_4/while/Identity:0
#preprocess/map_4/while/Identity_1:0
#preprocess/map_4/while/Less/Enter:0
preprocess/map_4/while/Less:0
!preprocess/map_4/while/LoopCond:0
preprocess/map_4/while/Merge:0
preprocess/map_4/while/Merge:1
 preprocess/map_4/while/Merge_1:0
 preprocess/map_4/while/Merge_1:1
&preprocess/map_4/while/NextIteration:0
(preprocess/map_4/while/NextIteration_1:0
preprocess/map_4/while/Switch:0
preprocess/map_4/while/Switch:1
!preprocess/map_4/while/Switch_1:0
!preprocess/map_4/while/Switch_1:1
0preprocess/map_4/while/TensorArrayReadV3/Enter:0
2preprocess/map_4/while/TensorArrayReadV3/Enter_1:0
*preprocess/map_4/while/TensorArrayReadV3:0
Bpreprocess/map_4/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
<preprocess/map_4/while/TensorArrayWrite/TensorArrayWriteV3:0
preprocess/map_4/while/add/y:0
preprocess/map_4/while/add:0
3preprocess/map_4/while/adjust_brightness/Identity:0
5preprocess/map_4/while/adjust_brightness/Identity_1:0
*preprocess/map_4/while/adjust_brightness:0
5preprocess/map_4/while/random_uniform/RandomUniform:0
+preprocess/map_4/while/random_uniform/max:0
+preprocess/map_4/while/random_uniform/min:0
+preprocess/map_4/while/random_uniform/mul:0
-preprocess/map_4/while/random_uniform/shape:0
+preprocess/map_4/while/random_uniform/sub:0
'preprocess/map_4/while/random_uniform:0R
preprocess/map_4/TensorArray:00preprocess/map_4/while/TensorArrayReadV3/Enter:0G
 preprocess/map_4/strided_slice:0#preprocess/map_4/while/Less/Enter:0f
 preprocess/map_4/TensorArray_1:0Bpreprocess/map_4/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0?
Mpreprocess/map_4/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:02preprocess/map_4/while/TensorArrayReadV3/Enter_1:0Rpreprocess/map_4/while/Enter:0R preprocess/map_4/while/Enter_1:0
?
$preprocess/map_5/while/while_context
*!preprocess/map_5/while/LoopCond:02preprocess/map_5/while/Merge:0:!preprocess/map_5/while/Identity:0Bpreprocess/map_5/while/Exit:0Bpreprocess/map_5/while/Exit_1:0J?
preprocess/map_5/TensorArray:0
Mpreprocess/map_5/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
 preprocess/map_5/TensorArray_1:0
 preprocess/map_5/strided_slice:0
preprocess/map_5/while/Enter:0
 preprocess/map_5/while/Enter_1:0
preprocess/map_5/while/Exit:0
preprocess/map_5/while/Exit_1:0
!preprocess/map_5/while/Identity:0
#preprocess/map_5/while/Identity_1:0
#preprocess/map_5/while/Less/Enter:0
preprocess/map_5/while/Less:0
!preprocess/map_5/while/LoopCond:0
preprocess/map_5/while/Merge:0
preprocess/map_5/while/Merge:1
 preprocess/map_5/while/Merge_1:0
 preprocess/map_5/while/Merge_1:1
&preprocess/map_5/while/NextIteration:0
(preprocess/map_5/while/NextIteration_1:0
preprocess/map_5/while/Switch:0
preprocess/map_5/while/Switch:1
!preprocess/map_5/while/Switch_1:0
!preprocess/map_5/while/Switch_1:1
0preprocess/map_5/while/TensorArrayReadV3/Enter:0
2preprocess/map_5/while/TensorArrayReadV3/Enter_1:0
*preprocess/map_5/while/TensorArrayReadV3:0
Bpreprocess/map_5/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
<preprocess/map_5/while/TensorArrayWrite/TensorArrayWriteV3:0
preprocess/map_5/while/add/y:0
preprocess/map_5/while/add:0
1preprocess/map_5/while/adjust_contrast/Identity:0
3preprocess/map_5/while/adjust_contrast/Identity_1:0
(preprocess/map_5/while/adjust_contrast:0
5preprocess/map_5/while/random_uniform/RandomUniform:0
+preprocess/map_5/while/random_uniform/max:0
+preprocess/map_5/while/random_uniform/min:0
+preprocess/map_5/while/random_uniform/mul:0
-preprocess/map_5/while/random_uniform/shape:0
+preprocess/map_5/while/random_uniform/sub:0
'preprocess/map_5/while/random_uniform:0f
 preprocess/map_5/TensorArray_1:0Bpreprocess/map_5/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0?
Mpreprocess/map_5/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:02preprocess/map_5/while/TensorArrayReadV3/Enter_1:0R
preprocess/map_5/TensorArray:00preprocess/map_5/while/TensorArrayReadV3/Enter:0G
 preprocess/map_5/strided_slice:0#preprocess/map_5/while/Less/Enter:0Rpreprocess/map_5/while/Enter:0R preprocess/map_5/while/Enter_1:0*?
serving_default?
*
examples
input_example_tensor:0C
predictions_for_true+
sample/strided_slice_2:0?????????tensorflow/serving/predict