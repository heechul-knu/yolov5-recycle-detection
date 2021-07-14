## Prepare datasets

It is recommended to dataset root to `./data`. The folder structure is same with [YOLOv5](https://github.com/ultralytics/yolov5)

```
.
└── data
    ├── images
    │   ├── train01
    │   │   ├── image1.jpg
    │   │   └── ...
    │   ├── train02
    │   │   └── ...
    │   ├── ...
    │   │
    │   ├── valid01
    │   │   └── ...
    │   ├── valid02
    │   │   └── ...
    │   ├── ...
    │   │
    │   ├── test01
    │   │   └── ...
    │   ├── test02
    │   │   └── ...
    │   └── ...
    └── labels
        ├── train01
        │   ├── image1.txt
        │   └── ...
        ├── train02
        │   └── ...
        ├── ...
        │
        ├── valid01
        │   └── ...
        ├── valid02
        │   └── ...
        ├── ...
        │
        ├── test01
        │   └── ...
        ├── test02
        │   └── ...
        └── ...
```

You can write `yaml`file of the above folder structure like this.
```yaml
base: './data/images'
train: ['train01', 'train02', ... ]
val: ['valid01', 'valid02', ... ]
test: ['test01', 'test02', ... ]

# num of class
nc: 80

# names of class
names: ['class_1', 'class_2', ... ]

```
