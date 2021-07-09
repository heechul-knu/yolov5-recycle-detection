## Prepare datasets

It is recommended to dataset root to `./data`. The folder structure is same with [YOLOv5](https://github.com/ultralytics/yolov5)

```
.
└── data
    ├── images
    │   ├── train
    │   │   ├── 01
    │   │   │   ├── image1.jpg
    │   │   │   └── ...
    │   │   ├── 02
    │   │   └── ...
    │   ├── val
    │   │   ├──v01
    │   │   └── ...
    │   └── test
    │       ├──t01
    │       └── ...
    └── labels
        ├── train
        │   ├── 01
        │   │   ├── image1.txt
        │   │   └── ...
        │   ├── 02
        │   └── ...
        ├── val
        │   ├──v01
        │   └── ...
        └── test
            ├──t01
            └── ...
```

You can write `yaml`file of the above folder structure like this.
```yaml
base: './data/images'
train: ['01', '02', ... ]
val: ['v01', 'v02', ... ]
test: ['t01', 't02', ... ]

# num of class
nc: 80

# names of class
names: ['class_1', 'class_2', ... ]

```
